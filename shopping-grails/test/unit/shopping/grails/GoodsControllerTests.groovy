package shopping.grails



import org.junit.*
import grails.test.mixin.*

@TestFor(GoodsController)
@Mock(Goods)
class GoodsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/goods/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.goodsInstanceList.size() == 0
        assert model.goodsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.goodsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.goodsInstance != null
        assert view == '/goods/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/goods/show/1'
        assert controller.flash.message != null
        assert Goods.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/goods/list'

        populateValidParams(params)
        def goods = new Goods(params)

        assert goods.save() != null

        params.id = goods.id

        def model = controller.show()

        assert model.goodsInstance == goods
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/goods/list'

        populateValidParams(params)
        def goods = new Goods(params)

        assert goods.save() != null

        params.id = goods.id

        def model = controller.edit()

        assert model.goodsInstance == goods
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/goods/list'

        response.reset()

        populateValidParams(params)
        def goods = new Goods(params)

        assert goods.save() != null

        // test invalid parameters in update
        params.id = goods.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/goods/edit"
        assert model.goodsInstance != null

        goods.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/goods/show/$goods.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        goods.clearErrors()

        populateValidParams(params)
        params.id = goods.id
        params.version = -1
        controller.update()

        assert view == "/goods/edit"
        assert model.goodsInstance != null
        assert model.goodsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/goods/list'

        response.reset()

        populateValidParams(params)
        def goods = new Goods(params)

        assert goods.save() != null
        assert Goods.count() == 1

        params.id = goods.id

        controller.delete()

        assert Goods.count() == 0
        assert Goods.get(goods.id) == null
        assert response.redirectedUrl == '/goods/list'
    }
}
