package shopping.grails

class Shop {

	String name
	String code
	String password
	String email
	String mainImage
	String description
	String toString() {
		name
	}
	static constraints = {
		name(size:3..20)
		code(size:3..10, matches:/\p{Alpha}[\w]*/)
		email(email: true)
		password(size:6..24,matches:/[\w]+/)
		mainImage(nullable:true, blank:true)
		description(blank:true, size:0..1024, nullable:true)
	}
}
