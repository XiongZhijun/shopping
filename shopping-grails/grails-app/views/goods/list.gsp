
<%@ page import="shopping.grails.Goods" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'goods.label', default: 'Goods')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-goods" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-goods" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'goods.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="sellingPrice" title="${message(code: 'goods.sellingPrice.label', default: 'Selling Price')}" />
					
						<g:sortableColumn property="unit" title="${message(code: 'goods.unit.label', default: 'Unit')}" />
					
						<th><g:message code="goods.shop.label" default="Shop" /></th>
					
						<th><g:message code="goods.category.label" default="Category" /></th>
					
						<g:sortableColumn property="thumbnail" title="${message(code: 'goods.thumbnail.label', default: 'Thumbnail')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${goodsInstanceList}" status="i" var="goodsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${goodsInstance.id}">${fieldValue(bean: goodsInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: goodsInstance, field: "sellingPrice")}</td>
					
						<td>${fieldValue(bean: goodsInstance, field: "unit")}</td>
					
						<td>${fieldValue(bean: goodsInstance, field: "shop")}</td>
					
						<td>${fieldValue(bean: goodsInstance, field: "category")}</td>
					
						<td><g:img uri="${goodsInstance?.thumbnail }" width="40px" height="40px"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${goodsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
