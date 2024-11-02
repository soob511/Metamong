package com.mycompany.metamong.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class LoginFilter implements Filter {

	 @Override
	    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	            throws IOException, ServletException {
	        
	        HttpServletRequest httpRequest = (HttpServletRequest) request;
	        HttpServletResponse httpResponse = (HttpServletResponse) response;
	        
	        String requestURI = httpRequest.getRequestURI();
	        String contextPath = httpRequest.getContextPath();
	        
	        if (requestURI.startsWith(contextPath+"/resources")) {
	            chain.doFilter(request, response); 
	            return;
	        }
	        
	        if (requestURI.startsWith(contextPath + "/member")) {
	            chain.doFilter(request, response); 
	            return;
	        }
	        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	        
	      
	        if (authentication == null || !authentication.isAuthenticated() || "anonymousUser".equals(authentication.getPrincipal())) {
	           
	            httpResponse.sendRedirect(httpRequest.getContextPath() + "/member/loginForm");
	            return;
	        }
	        
	    
	        chain.doFilter(request, response);
	    }
	
}
