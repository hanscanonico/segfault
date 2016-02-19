
<%@ page import="segfault2.UserMessage" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'userMessage.label', default: 'UserMessage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userMessage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userMessage">
			
				<g:if test="${userMessageInstance?.texte}">
				<li class="fieldcontain">
					<span id="texte-label" class="property-label"><g:message code="userMessage.texte.label" default="Texte" /></span>
					
						<span class="property-value" aria-labelledby="texte-label"><g:fieldValue bean="${userMessageInstance}" field="texte"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userMessageInstance?.mess}">
				<li class="fieldcontain">
					<span id="mess-label" class="property-label"><g:message code="userMessage.mess.label" default="Mess" /></span>
					
						<span class="property-value" aria-labelledby="mess-label"><g:link controller="userMessage" action="show" id="${userMessageInstance?.mess?.id}">${userMessageInstance?.mess?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userMessageInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="userMessage.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${userMessageInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userMessageInstance?.nbMoins}">
				<li class="fieldcontain">
					<span id="nbMoins-label" class="property-label"><g:message code="userMessage.nbMoins.label" default="Nb Moins" /></span>
					
						<span class="property-value" aria-labelledby="nbMoins-label"><g:fieldValue bean="${userMessageInstance}" field="nbMoins"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userMessageInstance?.nbPlus}">
				<li class="fieldcontain">
					<span id="nbPlus-label" class="property-label"><g:message code="userMessage.nbPlus.label" default="Nb Plus" /></span>
					
						<span class="property-value" aria-labelledby="nbPlus-label"><g:fieldValue bean="${userMessageInstance}" field="nbPlus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userMessageInstance?.reponses}">
				<li class="fieldcontain">
					<span id="reponses-label" class="property-label"><g:message code="userMessage.reponses.label" default="Reponses" /></span>
					
						<g:each in="${userMessageInstance.reponses}" var="r">
						<span class="property-value" aria-labelledby="reponses-label"><g:link controller="userMessage" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userMessageInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="userMessage.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" id="${userMessageInstance?.topic?.id}">${userMessageInstance?.topic?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userMessageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userMessageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
