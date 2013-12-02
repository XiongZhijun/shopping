package shopping.grails

class Goods {
	static final int COMMON = 1
	static final int DELETED = 2
	static final int INVALID = 3

	static belongsTo = [shop:Shop, category:GoodsCategory]

	String name
	double sellingPrice = 0.0
	String unit = '份'
	Shop shop
	GoodsCategory category
	String thumbnail
	String image1
	String image2
	String image3
	String image4
	String image5
	String description
	int status = COMMON

	String toString() {
		name
	}
	static constraints = {
		name(blank:false)
		sellingPrice(min:0.0d)
		unit blank:false
		shop(blank:false)
		category(blank:false) 
		thumbnail(blank:false)
		description(blank:false, size:0..1024)
	}
}
