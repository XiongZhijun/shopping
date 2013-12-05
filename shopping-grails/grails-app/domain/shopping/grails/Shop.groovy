package shopping.grails

class Shop {

	String name
	String code
	String email
	String mainImage
	String description
	String toString() {
		name
	}
	static belongsTo = [user : User]
	static constraints = {
		name(size:3..20)
		code(size:3..10, matches:/\w*/)
		email(email: true)
		mainImage(nullable:true, blank:true)
		description(blank:true, size:0..1024, nullable:true)
	}
}
