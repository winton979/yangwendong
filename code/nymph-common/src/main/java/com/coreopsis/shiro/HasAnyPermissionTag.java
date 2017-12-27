package com.coreopsis.shiro;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.tags.PermissionTag;

/**
 * <ol>
 * <li>扩展Shiro认证，可以多个权限分组，校验</li>
 * <ol>
 * 
 * @author jackzhong
 * @since 2014年11月15日下午9:28:57
 */
@SuppressWarnings("serial")
public class HasAnyPermissionTag extends PermissionTag {
	
	// Delimeter that separates role names in tag attribute
    private static final String ROLE_NAMES_DELIMETER = ",";

	/* (non-Javadoc)
	 * @see org.apache.shiro.web.tags.PermissionTag#showTagBody(java.lang.String)
	 */
	@Override
	protected boolean showTagBody(String permissions) {
		boolean hasPermission = false;
        Subject subject = getSubject();
        if (subject != null) {
            // Iterate through roles and check to see if the user has one of the roles
            for (String perm : permissions.split(ROLE_NAMES_DELIMETER)) {
                if (subject.isPermitted(perm.trim())) {
                	hasPermission = true;
                    break;
                }
            }
        }
        return hasPermission;
	}

}
