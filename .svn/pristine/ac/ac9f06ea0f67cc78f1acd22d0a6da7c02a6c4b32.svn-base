package com.jwt.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import com.jwt.model.User;

import com.jwt.service.UserService;
@Component
public class LogoutListener implements ApplicationListener<SessionDestroyedEvent > {

	@Autowired
	private UserService userService;
	
	
	
	@Override
	public void onApplicationEvent(SessionDestroyedEvent event) {
		List<SecurityContext> lstSecurityContext = event.getSecurityContexts();
        UserDetails ud;
        for (SecurityContext securityContext : lstSecurityContext)
        {
            ud = (UserDetails) securityContext.getAuthentication().getPrincipal();
        	User u=userService.getUser(ud.getUsername());
        	u.setActive(0);
			u = userService.updateUser(u);
			
            // ...
		
	    }
	}

}
