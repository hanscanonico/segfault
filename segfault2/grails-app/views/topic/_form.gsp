<%@ page import="segfault2.Topic" %>



<%--<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'messages', 'error')} ">
	<label for="messages">
		<g:message code="topic.messages.label" default="Messages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${topicInstance?.messages?}" var="m">
    <li><g:link controller="userMessage" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userMessage" action="create" params="['topic.id': topicInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userMessage.label', default: 'UserMessage')])}</g:link>
</li>
</ul>


</div>

--%>


	 
	  	<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'tag', 'error')} required">
	  	 <div class="form-group">
	<label for="tag">Tag *</label>
	<g:select class="form-control" id="tag" name="tag.id" from="${segfault2.Tag.list()}" optionKey="id" required="" value="${topicInstance?.tag?.id}" />
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'titre', 'error')} required">
 <div class="form-group">
	<label for="titre">Title *</label>
	<g:textField class="form-control" name="titre" required="" value="${topicInstance?.titre}"/>
	</div>
</div>
<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'tag', 'error')} required">
 <div class="form-group">
 
	<label for="firstMessage">First Message *</label>
	<g:if test="${topicInstance?.firstMessage}">
		<g:textArea class="form-control" name="firstMessage.texte"> </g:textArea>
	</g:if>
	<g:else>
		<g:textArea class="form-control" name="firstMessage.texte" value="${topicInstance?.firstMessage} "> </g:textArea>
	</g:else>
	</div>
</div>

