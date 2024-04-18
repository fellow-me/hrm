package com.qiujie.filter;

import com.qiujie.service.StaffDetailsService;
import com.qiujie.util.JwtUtil;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    @Resource
    private StaffDetailsService staffDetailsService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        // 获取认证信息
        String authorization = request.getHeader("Authorization");
        String username = "";
        if (StringUtils.hasText(authorization) && authorization.startsWith("Bearer ")) {
            String token = authorization.substring(7).trim(); // 截取token
            if (StringUtils.hasText(token)) {
                // 解析username
                try {
                    username = JwtUtil.extractUsername(token);
                } catch (Exception e) {
                    this.logger.warn(e.getMessage());
                }
            }
        }
        if (StringUtils.hasText(username)) {
            // 获取信息
            UserDetails userDetails = this.staffDetailsService.loadUserByUsername(username);
            if (userDetails != null) {
                // 存入SecurityContextHolder中
                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken =
                        new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                usernamePasswordAuthenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
            }
        }
        filterChain.doFilter(request, response);
    }
}