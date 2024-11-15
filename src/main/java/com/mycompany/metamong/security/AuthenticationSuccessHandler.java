package com.mycompany.metamong.security;

import java.io.IOException;
import java.util.Collection;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class AuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {

		MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();
        Collection<? extends GrantedAuthority> authorities = memberDetails.getAuthorities();
        request.getSession().removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");
        
        for (GrantedAuthority authority : authorities) {
            if (authority.getAuthority().equals("ROLE_ADMIN")) {
                response.sendRedirect("/Metamong/homeAdmin");
                return;
            } else if (authority.getAuthority().equals("ROLE_DBA")) {
                response.sendRedirect("/Metamong/homeDBA");
                return;
            } else if (authority.getAuthority().equals("ROLE_USER")) {
                response.sendRedirect("/Metamong/homeUser");
                return;
            }
        }
        
	}
}
