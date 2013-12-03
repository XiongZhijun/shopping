import shopping.grails.Role
import shopping.grails.User
import shopping.grails.UserRole

class BootStrap {

    def init = { servletContext ->
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)

        def testUser = new User(username: 'admin', password: '1234')
        testUser.save(flush: true)

        UserRole.create testUser, adminRole, true
    }
    def destroy = {
    }
}
