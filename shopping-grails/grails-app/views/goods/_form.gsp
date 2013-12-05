<%@ page import="shopping.grails.Goods" %>



<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="goods.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${goodsInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'sellingPrice', 'error')} required">
	<label for="sellingPrice">
		<g:message code="goods.sellingPrice.label" default="Selling Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sellingPrice" type="number" value="${fieldValue(bean: goodsInstance, field: 'sellingPrice')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'unit', 'error')} required">
	<label for="unit">
		<g:message code="goods.unit.label" default="Unit" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="unit" required="" value="${goodsInstance?.unit}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'shop', 'error')} required">
	<label for="shop">
		<g:message code="goods.shop.label" default="Shop" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="shop" name="shop.id" from="${shopping.grails.Shop.list()}" optionKey="id" required="" value="${goodsInstance?.shop?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="goods.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${shopping.grails.GoodsCategory.list()}" optionKey="id" required="" value="${goodsInstance?.category?.id}" class="many-to-one"/>
</div>
<div class="fieldcontain">
	<label >
	</label>
	<g:img id="thumbnailImage" uri="${goodsInstance?.thumbnail}" width="80px" height="80px"/>
</div>
<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'thumbnail', 'error')} required">
	<label for="thumbnail">
		<g:message code="goods.thumbnail.label" default="Thumbnail" />
		<span class="required-indicator">*</span>
	</label>
	<uploader:uploader multiple="false" allowedExtensions="['"png"','"jpg"','"jpeg"']" id="thumbnailUploader" url="${[controller:'ajaxUpload',action:'upload'] }" >
	<uploader:onComplete> 
		$('#thumbnailImage').attr('src',"${createLink(uri: '/static/upload/')}"+fileName)
		$('#thumbnail').val("/static/upload/"+fileName)
	</uploader:onComplete>
	</uploader:uploader>
	<g:textField name="thumbnail" value="${goodsInstance?.thumbnail}" style="display:none"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="goods.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1024" required="" value="${goodsInstance?.description}"/>
</div>

<table>
  <tr>
  <g:each in="${ 1..5 }">
  <td width="20%" height="200px" align="center">
  	<g:img align="middle" id="img${it}" uri="${goodsInstance ? goodsInstance['image'+it] : null }" width="100px" height="200px"/>
  </td>
  </g:each>
  </tr>
  <tr style="display: none">
  <g:each in="${ 1..5 }">
  <td><input type="text" id="image${it}" name="image${it}" value="${goodsInstance ? goodsInstance['image'+it] : null}"/></td>
  </g:each>
  </tr>
  <tr>
  <g:each in="${ 1..5 }">
  <td><uploader:uploader debug="true" multiple="false" allowedExtensions="['"png"','"jpg"','"jpeg"']" id="imgUploader${it}" url="${[controller:'ajaxUpload',action:'upload'] }" >
	<uploader:onComplete> 
		$('#img${it}').attr('src',"${createLink(uri: '/static/upload/')}"+fileName)
		$('#image${it}').val("/static/upload/"+fileName)
	</uploader:onComplete>
	</uploader:uploader></td>
  </g:each>
  </tr>
</table>

	

