package shopping.grails

import grails.plugin.springsecurity.annotation.Secured;

import org.springframework.dao.DataIntegrityViolationException
class ShopController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	static navigation = [
		group:'tabs',
		order:10,
		title:'商店管理',
		action:'list'
	]


	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[shopInstanceList: Shop.list(params), shopInstanceTotal: Shop.count()]
	}

	def create() {
		[shopInstance: new Shop(params)]
	}

	def save() {
		def shopInstance = new Shop(params)
		if (!shopInstance.save(flush: true)) {
			render(view: "create", model: [shopInstance: shopInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'shop.label', default: 'Shop'),
			shopInstance.id
		])
		redirect(action: "show", id: shopInstance.id)
	}

	def show(Long id) {
		def shopInstance = Shop.get(id)
		if (!shopInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'shop.label', default: 'Shop'),
				id
			])
			redirect(action: "list")
			return
		}

		[shopInstance: shopInstance]
	}

	def edit(Long id) {
		def shopInstance = Shop.get(id)
		if (!shopInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'shop.label', default: 'Shop'),
				id
			])
			redirect(action: "list")
			return
		}

		[shopInstance: shopInstance]
	}

	def update(Long id, Long version) {
		def shopInstance = Shop.get(id)
		if (!shopInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'shop.label', default: 'Shop'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (shopInstance.version > version) {
				shopInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'shop.label', default: 'Shop')] as Object[],
						"Another user has updated this Shop while you were editing")
				render(view: "edit", model: [shopInstance: shopInstance])
				return
			}
		}

		shopInstance.properties = params

		if (!shopInstance.save(flush: true)) {
			render(view: "edit", model: [shopInstance: shopInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'shop.label', default: 'Shop'),
			shopInstance.id
		])
		redirect(action: "show", id: shopInstance.id)
	}

	def delete(Long id) {
		def shopInstance = Shop.get(id)
		if (!shopInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'shop.label', default: 'Shop'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			shopInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'shop.label', default: 'Shop'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'shop.label', default: 'Shop'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
