package com.qiujie.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qiujie.entity.RoleMenu;
import com.qiujie.enums.BusinessStatusEnum;
import com.qiujie.exception.ServiceException;
import com.qiujie.mapper.RoleMenuMapper;
import com.qiujie.dto.Response;
import com.qiujie.dto.ResponseDTO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author qiujie
 * @since 2022-02-28
 */
@Service
public class RoleMenuService extends ServiceImpl<RoleMenuMapper, RoleMenu> {

    /**
     * 为角色设置菜单
     *
     * @param roleId
     * @param menuIds
     * @return
     */
    @Transactional
    public ResponseDTO setMenu(Integer roleId, List<Integer> menuIds) {
        QueryWrapper<RoleMenu> wrapper = new QueryWrapper<>();
        wrapper.eq("role_id", roleId);
        List<RoleMenu> list = list(wrapper);
        // 先禁用不需要的菜单
        for (RoleMenu roleMenu : list) {
            if (menuIds.contains(roleMenu.getMenuId())) {
                roleMenu.setStatus(1); // 启用
            } else {
                roleMenu.setStatus(0); // 禁用
            }
            updateById(roleMenu);
        }

        for (Integer menuId : menuIds) {
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(menuId);
            roleMenu.setStatus(1);
            QueryWrapper<RoleMenu> queryWrapper = new QueryWrapper();
            queryWrapper.eq("role_id", roleId).eq("menu_id", menuId);
            // 若角色拥有此菜单，则只需将status设为1即可；若不拥有此菜单，则新增，并将status设为1。
            if (!saveOrUpdate(roleMenu, queryWrapper)) {
                throw new ServiceException(BusinessStatusEnum.ERROR);
            }
        }
        return Response.success();
    }

    /**
     * 获取角色的菜单
     *
     * @param roleId
     * @return
     */
    public ResponseDTO getMenu(Integer roleId) {
        QueryWrapper<RoleMenu> wrapper = new QueryWrapper<>();
        wrapper.eq("role_id", roleId).eq("status", 1);
        List<RoleMenu> list = list(wrapper);
        return Response.success(list);
    }


}




