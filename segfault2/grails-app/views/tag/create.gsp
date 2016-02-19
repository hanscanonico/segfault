<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="content">
			<div class="container bs-docs-container">
				<div id="create-tag" class="content scaffold-create" role="main">
					<h1><g:message code="default.create.label" args="[entityName]" /></h1>
					<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${tagInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${tagInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form url="[resource:tagInstance, action:'save']" >
						<fieldset class="form">
							<g:render template="form"/>
						
							<fieldset class="buttons">
							
								<g:submitButton class="btn btn-primary" name="create"  value="${message(code: 'default.button.create.label', default: 'Create')}" />
							</fieldset>
						</fieldset>
					</g:form>
				</div>
				</div>
		</div>
	</body>
</html>
