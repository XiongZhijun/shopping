
<%@ page import="shopping.grails.Shop" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shop.label', default: 'Shop')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shop" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shop" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'shop.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'shop.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'shop.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'shop.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="mainImage" title="${message(code: 'shop.mainImage.label', default: 'Main Image')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'shop.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shopInstanceList}" status="i" var="shopInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shopInstance.id}">${fieldValue(bean: shopInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: shopInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: shopInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: shopInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: shopInstance, field: "mainImage")}</td>
					
						<td>${fieldValue(bean: shopInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shopInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
