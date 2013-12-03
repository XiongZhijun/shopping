package shopping.grails

import org.springframework.dao.DataIntegrityViolationException

class GoodsController {

	static scaffold = Goods
	static navigation = [
		group:'tabs',
		order:10,
		title:'商品管理',
		action:'list'
	]
}
