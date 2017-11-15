package com.xianlei.base.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class RequestFilter implements Filter {

	@Override
	public void destroy() {
		System.out.println("MyFilter destroy...");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		  HttpServletRequest request = (HttpServletRequest) req;
	        String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
	        request.setAttribute("path",path);
	        request.setAttribute("webRoot",path);
	        request.setAttribute("resRoot",path+"/assets");
//	        Subject subject = SecurityUtils.getSubject();
//	        request.setAttribute(Constants.LOGIN_USER, subject.getPrincipal());
	        RequestContext.setRequest(request);
	        chain.doFilter(req, resp);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("MyFilter init...");
	}

}
