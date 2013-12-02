package shopping.grails

class Shop {

	String name
	String code
	String password
	String email
	String mainImage
	String description

	static constraints = {
		name(size:3..20)
		code(size:3..10, matches:/\p{Alpha}[\w]*/)
		password(size:6..24,matches:/[\w]+/)
		email(email: true)
		mainImage ()
		description ( blank:true)
	}
}
