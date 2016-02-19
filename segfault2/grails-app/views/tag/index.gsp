
<%@ page import="segfault2.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div id="content">
<div class="container bs-docs-container">
			<%--<a href="#list-tag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		--%>
			<div id="list-tag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		
			
				<div class="list-group">
					<g:each in="${tagInstanceList}" status="i" var="tagInstance">
						<%--<a href="#" class="list-group-item">Dapibus ac facilisis in</a>--%>
						<g:link class="list-group-item" action="show" id="${tagInstance.id}">${fieldValue(bean: tagInstance, field: "titre")}</g:link>
					
					</g:each>
				</div>
			
		
			<div class="pagination">
				<g:paginate total="${tagInstanceCount ?: 0}" />
			</div>
		</div>
			
		
				<%--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
			 <sec:ifAllGranted roles="ROLE_ADMIN">	
					 	<g:link  class="btn btn-primary" action="create">Add a Tag</g:link>
		
			 
			 </sec:ifAllGranted> 
		
		</div>
		</div>
	</body>
</html>
