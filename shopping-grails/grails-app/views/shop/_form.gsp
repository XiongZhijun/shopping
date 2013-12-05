<%@ page import="shopping.grails.Shop" %>



<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="shop.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="20" value="${shopInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="shop.code.label" default="Code" />
		
	</label>
	<g:textField name="code" maxlength="10"  value="${shopInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="shop.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${shopInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'mainImage', 'error')} ">
	<label for="mainImage">
		<g:message code="shop.mainImage.label" default="Main Image" />
		
	</label>
	<g:textField name="mainImage" value="${shopInstance?.mainImage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="shop.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1024" value="${shopInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="shop.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${shopping.grails.User.list()}" optionKey="id" required="" value="${shopInstance?.user?.id}" class="many-to-one"/>
</div>

