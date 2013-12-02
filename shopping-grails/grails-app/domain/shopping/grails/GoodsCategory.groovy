package shopping.grails

class GoodsCategory {
	static hasMany = [goodsList:Goods]
	static belongsTo = [shop:Shop]

	String name
	String description


	static constraints = {
		name(blank:false)
		description(blank:true,nullable:true,size:0..1024)
	}
}
