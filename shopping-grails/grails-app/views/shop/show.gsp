
<%@ page import="shopping.grails.Shop" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shop.label', default: 'Shop')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-shop" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-shop" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list shop">
			
				<g:if test="${shopInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="shop.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${shopInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="shop.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${shopInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="shop.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${shopInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.mainImage}">
				<li class="fieldcontain">
					<span id="mainImage-label" class="property-label"><g:message code="shop.mainImage.label" default="Main Image" /></span>
					
						<span class="property-value" aria-labelledby="mainImage-label"><g:fieldValue bean="${shopInstance}" field="mainImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="shop.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${shopInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shopInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="shop.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${shopInstance?.user?.id}">${shopInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${shopInstance?.id}" />
					<g:link class="edit" action="edit" id="${shopInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
