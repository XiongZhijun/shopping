package shopping.grails

import org.springframework.dao.DataIntegrityViolationException

class GoodsCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [goodsCategoryInstanceList: GoodsCategory.list(params), goodsCategoryInstanceTotal: GoodsCategory.count()]
    }

    def create() {
        [goodsCategoryInstance: new GoodsCategory(params)]
    }

    def save() {
        def goodsCategoryInstance = new GoodsCategory(params)
        if (!goodsCategoryInstance.save(flush: true)) {
            render(view: "create", model: [goodsCategoryInstance: goodsCategoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'goodsCategory.label', default: 'GoodsCategory'), goodsCategoryInstance.id])
        redirect(action: "show", id: goodsCategoryInstance.id)
    }

    def show(Long id) {
        def goodsCategoryInstance = GoodsCategory.get(id)
        if (!goodsCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goodsCategory.label', default: 'GoodsCategory'), id])
            redirect(action: "list")
            return
        }

        [goodsCategoryInstance: goodsCategoryInstance]
    }

    def edit(Long id) {
        def goodsCategoryInstance = GoodsCategory.get(id)
        if (!goodsCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goodsCategory.label', default: 'GoodsCategory'), id])
            redirect(action: "list")
            return
        }

        [goodsCategoryInstance: goodsCategoryInstance]
    }

    def update(Long id, Long version) {
        def goodsCategoryInstance = GoodsCategory.get(id)
        if (!goodsCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goodsCategory.label', default: 'GoodsCategory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (goodsCategoryInstance.version > version) {
                goodsCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'goodsCategory.label', default: 'GoodsCategory')] as Object[],
                          "Another user has updated this GoodsCategory while you were editing")
                render(view: "edit", model: [goodsCategoryInstance: goodsCategoryInstance])
                return
            }
        }

        goodsCategoryInstance.properties = params

        if (!goodsCategoryInstance.save(flush: true)) {
            render(view: "edit", model: [goodsCategoryInstance: goodsCategoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'goodsCategory.label', default: 'GoodsCategory'), goodsCategoryInstance.id])
        redirect(action: "show", id: goodsCategoryInstance.id)
    }

    def delete(Long id) {
        def goodsCategoryInstance = GoodsCategory.get(id)
        if (!goodsCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goodsCategory.label', default: 'GoodsCategory'), id])
            redirect(action: "list")
            return
        }

        try {
            goodsCategoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'goodsCategory.label', default: 'GoodsCategory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'goodsCategory.label', default: 'GoodsCategory'), id])
            redirect(action: "show", id: id)
        }
    }
}
