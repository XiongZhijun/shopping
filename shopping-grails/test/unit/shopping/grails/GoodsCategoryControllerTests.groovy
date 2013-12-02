package shopping.grails



import org.junit.*
import grails.test.mixin.*

@TestFor(GoodsCategoryController)
@Mock(GoodsCategory)
class GoodsCategoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/goodsCategory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.goodsCategoryInstanceList.size() == 0
        assert model.goodsCategoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.goodsCategoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.goodsCategoryInstance != null
        assert view == '/goodsCategory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/goodsCategory/show/1'
        assert controller.flash.message != null
        assert GoodsCategory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/goodsCategory/list'

        populateValidParams(params)
        def goodsCategory = new GoodsCategory(params)

        assert goodsCategory.save() != null

        params.id = goodsCategory.id

        def model = controller.show()

        assert model.goodsCategoryInstance == goodsCategory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/goodsCategory/list'

        populateValidParams(params)
        def goodsCategory = new GoodsCategory(params)

        assert goodsCategory.save() != null

        params.id = goodsCategory.id

        def model = controller.edit()

        assert model.goodsCategoryInstance == goodsCategory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/goodsCategory/list'

        response.reset()

        populateValidParams(params)
        def goodsCategory = new GoodsCategory(params)

        assert goodsCategory.save() != null

        // test invalid parameters in update
        params.id = goodsCategory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/goodsCategory/edit"
        assert model.goodsCategoryInstance != null

        goodsCategory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/goodsCategory/show/$goodsCategory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        goodsCategory.clearErrors()

        populateValidParams(params)
        params.id = goodsCategory.id
        params.version = -1
        controller.update()

        assert view == "/goodsCategory/edit"
        assert model.goodsCategoryInstance != null
        assert model.goodsCategoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/goodsCategory/list'

        response.reset()

        populateValidParams(params)
        def goodsCategory = new GoodsCategory(params)

        assert goodsCategory.save() != null
        assert GoodsCategory.count() == 1

        params.id = goodsCategory.id

        controller.delete()

        assert GoodsCategory.count() == 0
        assert GoodsCategory.get(goodsCategory.id) == null
        assert response.redirectedUrl == '/goodsCategory/list'
    }
}
