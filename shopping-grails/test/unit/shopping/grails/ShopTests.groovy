package shopping.grails



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Shop)
class ShopTests {

	void testCreateAndSave() {
		def shop = new Shop(name:"外婆家",code:"wpj",
			password:'password',mainImage:"http://wpj.com/wpj.jpg",
			description:"外婆家是一个餐饮企业",email:"zs@zs.com")
		//shop.save()
		Assert.assertEquals('外婆家', shop.name)
		Assert.assertEquals('password', shop.password)
		Assert.assertEquals('wpj', shop.code)
		Assert.assertEquals('http://wpj.com/wpj.jpg', shop.mainImage)
		Assert.assertEquals('外婆家是一个餐饮企业', shop.description)

		Assert.assertTrue(shop.validate())
		Assert.assertFalse(new Shop().validate())
	}
}
