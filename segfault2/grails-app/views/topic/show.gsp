
<%@ page import="segfault2.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container bs-docs-container">
		
		<div id="show-topic" class="content scaffold-show" role="main">
			<h1>${topicInstance} (${topicInstance?.tag?.encodeAsHTML()})</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
		
		   
		   <g:formatDate format="yyyy-MM-dd HH:mm" date="${topicInstance.firstMessage?.date}"/>
				
				<div class="panel panel-default">
		
							    <g:link  class="btn btn-default" controller="Topic" action="upComment"  params="[values: "${topicInstance.firstMessage.id}#${topicInstance.firstMessage.id}" ]">
							   +
							 </g:link>
				      (${topicInstance.firstMessage.nbPlus})
			 		 <g:link  class="btn btn-default" controller="Topic" action="downComment"  params="[values: "${topicInstance.firstMessage.id}#${topicInstance.firstMessage.id}" ]">
							   -
					</g:link>
					  (${topicInstance.firstMessage.nbMoins})
					<div class=" panel-body">
					${topicInstance.firstMessage.texte }
					</div>
				</div>	
		    	<g:if test="${topicInstance?.messages}">
			<g:each in="${topicInstance?.messages}" var="m">
				${m?.user} 
				
				<g:formatDate format="yyyy-MM-dd HH:mm" date="${m?.date}"/>
				
				<div class="panel panel-default">
		
							    <g:link  class="btn btn-default" controller="Topic" action="upComment"  params="[values: "${topicInstance.id}#${m.id}" ]">
							   +
							 </g:link>
				      (${m.nbPlus})
			 		 <g:link  class="btn btn-default" controller="Topic" action="downComment"  params="[values: "${topicInstance.id}#${m.id}" ]">
							   -
					</g:link>
					  (${m.nbMoins})
					<div class=" panel-body">
					${m }
					</div>
				</div>	
			</g:each>
			</g:if>
		    <g:link  class="btn btn-primary" controller="UserMessage" action="addComment" params="[topicId:"${topicInstance.id}"]" >add a comment</g:link>
		    
			<g:form url="[resource:topicInstance, action:'delete']" method="DELETE">
				<sec:ifAllGranted roles="ROLE_ADMIN"><fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${topicInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				
				<g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				</fieldset></sec:ifAllGranted>
			</g:form>
		</div>

		</div>
	</body>
</html>
