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
	<g:textField name="code" maxlength="10" pattern="${shopInstance.constraints.code.matches}" value="${shopInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="shop.password.label" default="Password" />
		
	</label>
	<g:textField name="password" maxlength="24" pattern="${shopInstance.constraints.password.matches}" value="${shopInstance?.password}"/>
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
	<g:textField name="description" value="${shopInstance?.description}"/>
</div>

