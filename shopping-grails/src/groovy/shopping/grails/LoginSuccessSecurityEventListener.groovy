/**
 * All right reserved.
 */
package shopping.grails

import grails.plugin.springsecurity.web.SecurityRequestHolder

import org.springframework.context.ApplicationListener
import org.springframework.security.authentication.event.AuthenticationSuccessEvent
import org.springframework.security.core.Authentication
import org.springframework.transaction.annotation.Transactional

/**
 * @author Xiong
 *
 */
@Transactional
class LoginSuccessSecurityEventListener implements ApplicationListener<AuthenticationSuccessEvent> {

	@Override
	public void onApplicationEvent(AuthenticationSuccessEvent event) {
		Authentication authentication = event.authentication
		def userId = event.authentication?.principal?.id
		if (userId == null || userId <= 0) {
			return;
		}
		def session = SecurityRequestHolder.request.session
		def shop = Shop.find {
			user.id == userId
		}
		session['shop'] = shop
	}
}
