package shopping.grails

import org.springframework.dao.DataIntegrityViolationException

class GoodsCategoryController {

	static scaffold = GoodsCategory
	static navigation = [
		group:'tabs',
		order:10,
		title:'商品分类管理',
		action:'list'
	]
}
