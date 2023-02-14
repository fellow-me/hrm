package com.qiujie.service;

import cn.hutool.core.util.StrUtil;
import com.auth0.jwt.JWT;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qiujie.dto.Response;
import com.qiujie.dto.ResponseDTO;
import com.qiujie.entity.Menu;
import com.qiujie.entity.RoleMenu;
import com.qiujie.entity.StaffRole;
import com.qiujie.enums.BusinessStatusEnum;
import com.qiujie.exception.ServiceException;
import com.qiujie.mapper.MenuMapper;
import com.qiujie.util.HutoolExcelUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author qiujie
 * @since 2022-02-28
 */
@Service
public class MenuService extends ServiceImpl<MenuMapper, Menu> {

    @Resource
    private RoleMenuService roleMenuService;

    @Resource
    private StaffRoleService staffRoleService;


    public ResponseDTO add(Menu menu) {
        if (save(menu)) {
            return Response.success();
        }
        return Response.error();
    }

    public ResponseDTO deleteById(Integer id) {
        if (removeById(id)) {
            return Response.success();
        }
        return Response.error();
    }

    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO deleteBatch(List<Integer> ids) {
        if (removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO edit(Menu menu) {
        if (updateById(menu)) {
            return Response.success();
        }
        return Response.error();
    }


    public ResponseDTO findById(Integer id) {
        Menu menu = getById(id);
        if (menu != null) {
            return Response.success(menu);
        }
        return Response.error();
    }

    /**
     * 查找所有菜单
     *
     * @return
     */
    public ResponseDTO findAll() {
        List<Menu> list = list();
        // 为父级菜单设置子菜单
        return Response.success(setSubMenu(list));
    }


    public ResponseDTO list(Integer current, Integer size, String name) {
        IPage<Menu> config = new Page<>(current, size);
        QueryWrapper<Menu> wrapper = new QueryWrapper<>();
        if (name != "" && name != null) {
            wrapper.like("name", name);
        }
        wrapper.eq("parent_id", 0);
        IPage<Menu> page = page(config, wrapper);
        // 查询所有菜单
        List<Menu> list = list();
        // 父级菜单
        List<Menu> parentList = page.getRecords();
        for (Menu parentMenu : parentList) {
            // 设置子菜单
            List<Menu> subList = list.stream().filter(menu -> menu.getParentId() == parentMenu.getId()).collect(Collectors.toList());
            parentMenu.setChildren(subList);
        }
        // 将响应数据填充到map中
        Map map = new HashMap();
        map.put("pages", page.getPages());
        map.put("total", page.getTotal());
        map.put("list", page.getRecords());
        return Response.success(map);
    }

    /**
     * 数据导出
     *
     * @param response
     * @return
     */
    public ResponseDTO export(HttpServletResponse response) throws IOException {
        List<Menu> list = list();
        HutoolExcelUtil.writeExcel(response, list, "菜单数据", Menu.class);
        return Response.success();
    }

    /**
     * 数据导入
     *
     * @param file
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO imp(MultipartFile file) throws IOException {
        InputStream inputStream = file.getInputStream();
        List<Menu> list = HutoolExcelUtil.readExcel(inputStream, 1, Menu.class);
        // IService接口中的方法.批量插入数据
        if (saveBatch(list)) {
            return Response.success();
        }
        return Response.error();
    }

    /**
     * 为父级菜单设置子菜单，使用流来处理数据，并返回父级菜单
     *
     * @param list
     * @return
     */
    public List<Menu> setSubMenu(List<Menu> list) {
        // 父级菜单
        List<Menu> parentList = list.stream().parallel()
                .filter(menu -> menu.getParentId() == 0).collect(Collectors.toList());
        for (Menu parentMenu : parentList) {
            // 子菜单
            List<Menu> subList = list.stream().parallel()
                    .filter(menu -> menu.getParentId() == parentMenu.getId()).collect(Collectors.toList());
            parentMenu.setChildren(subList);
        }
        return parentList;
    }

    public ResponseDTO getStaffMenu(HttpServletRequest request) {
        String token = request.getHeader("token");// 从 http 请求头中取出 token
        if (StrUtil.isNotBlank(token)) {
            // 获取token中的id
            Integer id = Integer.valueOf(JWT.decode(token).getAudience().get(0));
            Set<Menu> set = new HashSet<>();
            List<StaffRole> staffRoleList = this.staffRoleService.list(new QueryWrapper<StaffRole>()
                    .eq("staff_id", id).eq("status", 1));
            for (StaffRole staffRole : staffRoleList) {
                List<RoleMenu> roleMenuList = this.roleMenuService.list(new QueryWrapper<RoleMenu>()
                        .eq("role_id", staffRole.getRoleId()).eq("status", 1));
                for (RoleMenu roleMenu : roleMenuList) {
                    List<Menu> menuList = list(new QueryWrapper<Menu>().eq("id", roleMenu.getMenuId()));
                    set.addAll(menuList); // 添加到set中，并去重
                }
            }
            List<Menu> menus = new ArrayList<>(set);
            // 根据获得的菜单，为父级菜单设置子菜单
            return Response.success(setSubMenu(menus));
        }
        throw new ServiceException(BusinessStatusEnum.TOKEN_NOT_EXIST);
    }


    /**
     * 通过员工id查询菜单,使用流处理数据，减少对数据库的查询次数
     *
     * @param id
     * @return
     */
    public ResponseDTO getStaffMenuPlus(Integer id) {
        List<Menu> staffMenu = new ArrayList<>();
        List<StaffRole> staffRoleList = this.staffRoleService.list(new QueryWrapper<StaffRole>()
                .eq("staff_id", id).eq("status", 1));
        List<RoleMenu> roleMenuList = this.roleMenuService.list(new QueryWrapper<RoleMenu>().eq("status", 1));
        List<Menu> menuList = list();
        for (StaffRole staffRole : staffRoleList) {
            List<RoleMenu> roleMenus = roleMenuList.stream().parallel().filter(roleMenu -> roleMenu.getRoleId() == staffRole.getRoleId())
                    .collect(Collectors.toList());
            for (RoleMenu roleMenu : roleMenus) {
                List<Menu> menus = menuList.stream().parallel().filter(menu -> menu.getId() == roleMenu.getMenuId())
                        .collect(Collectors.toList());
                staffMenu.addAll(menus);
            }
        }
        // 根据获得的菜单，为父级菜单设置子菜单
        return Response.success(setSubMenu(staffMenu.stream().parallel().distinct().collect(Collectors.toList())));
    }
}




