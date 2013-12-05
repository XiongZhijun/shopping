
<%@ page import="shopping.grails.Goods"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'goods.label', default: 'Goods')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<style type="text/css">
table {
	border-top: 1px solid #DFDFDF;
	border-collapse: collapse;
	margin-bottom: 1em;
	width: 0px;
}
</style>
</head>
<body>
	<a href="#show-goods" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-goods" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list goods">

			<g:if test="${goodsInstance?.name}">
				<li class="fieldcontain"><span id="name-label"
					class="property-label"><g:message code="goods.name.label"
							default="Name" /></span> <span class="property-value"
					aria-labelledby="name-label"><g:fieldValue
							bean="${goodsInstance}" field="name" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.sellingPrice}">
				<li class="fieldcontain"><span id="sellingPrice-label"
					class="property-label"><g:message
							code="goods.sellingPrice.label" default="Selling Price" /></span> <span
					class="property-value" aria-labelledby="sellingPrice-label"><g:fieldValue
							bean="${goodsInstance}" field="sellingPrice" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.unit}">
				<li class="fieldcontain"><span id="unit-label"
					class="property-label"><g:message code="goods.unit.label"
							default="Unit" /></span> <span class="property-value"
					aria-labelledby="unit-label"><g:fieldValue
							bean="${goodsInstance}" field="unit" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.shop}">
				<li class="fieldcontain"><span id="shop-label"
					class="property-label"><g:message code="goods.shop.label"
							default="Shop" /></span> <span class="property-value"
					aria-labelledby="shop-label"><g:link controller="shop"
							action="show" id="${goodsInstance?.shop?.id}">
							${goodsInstance?.shop?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>

			<g:if test="${goodsInstance?.category}">
				<li class="fieldcontain"><span id="category-label"
					class="property-label"><g:message
							code="goods.category.label" default="Category" /></span> <span
					class="property-value" aria-labelledby="category-label"><g:link
							controller="goodsCategory" action="show"
							id="${goodsInstance?.category?.id}">
							${goodsInstance?.category?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>

			<g:if test="${goodsInstance?.thumbnail}">
				<li class="fieldcontain"><span id="thumbnail-label"
					class="property-label"><g:message
							code="goods.thumbnail.label" default="Thumbnail" /></span> <span
					class="property-value" aria-labelledby="thumbnail-label"> <g:img
							id="thumbnailImage" uri="${goodsInstance?.thumbnail}"
							width="80px" height="80px" /></span></li>
			</g:if>


			<g:if test="${goodsInstance?.description}">
				<li class="fieldcontain"><span id="description-label"
					class="property-label"><g:message
							code="goods.description.label" default="Description" /></span> <span
					class="property-value" aria-labelledby="description-label"><g:fieldValue
							bean="${goodsInstance}" field="description" /></span></li>
			</g:if>


		</ol>
		<table>
			<tr>
				<g:each in="${1..5 }">
					<g:if test="${ goodsInstance && goodsInstance["image" + it]}">
						<td><img width="100px" height="200px"
							src="${createLink(uri:goodsInstance["image" + it]) }"></td>
					</g:if>
				</g:each>

			</tr>
		</table>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${goodsInstance?.id}" />
				<g:link class="edit" action="edit" id="${goodsInstance?.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
