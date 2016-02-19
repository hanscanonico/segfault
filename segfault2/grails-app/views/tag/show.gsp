
<%@ page import="segfault2.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	
		
		<div class="container bs-docs-container"><%--
			<a href="#show-tag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<div class="nav" role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
					<sec:ifAllGranted roles="ROLE_ADMIN"><li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li></sec:ifAllGranted> 
				</ul>
			</div>
		--%><div id="show-tag" class="content scaffold-show" role="main">
		
			<h1>${tagInstance?.titre}</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
				<g:if test="${tagInstance?.topics}">

					<div id="list-tag" class="content scaffold-list" role="main">
						<div class="list-group">
							<g:each in="${tagInstance.topics}" var="t">
								<g:link controller="topic" class="list-group-item" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link>
							</g:each>
						</div>
					</div>
					

				</g:if>
			
			<g:form url="[resource:tagInstance, action:'delete']" method="DELETE">
				<sec:ifAllGranted roles="ROLE_ADMIN"><fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tagInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<sec:ifAllGranted roles="ROLE_ADMIN"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></sec:ifAllGranted> 
					
				</fieldset></sec:ifAllGranted>
			</g:form>
		</div>
		</div>
	</body>
</html>
