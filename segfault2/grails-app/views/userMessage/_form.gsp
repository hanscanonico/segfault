<%@ page import="segfault2.UserMessage" %>


<div class="form-group">
	<div class="fieldcontain ${hasErrors(bean: userMessageInstance, field: 'texte', 'error')} required">
		<label for="texte">
			<g:message code="userMessage.texte.label" default="Texte" />
			<span class="required-indicator">*</span>
		</label>
		<g:textArea class="form-control" name="texte" cols="40" rows="5" maxlength="1000" required="" value="${userMessageInstance?.texte}"/>
	
	</div>

	<g:if test="${topicInstance}">
	
	<%--<g:each in='${topicInstance?.messages?}' var='elem'>
	      <p>Display something for first element ${topicInstance?.messages?.first().id}</p>
	</g:each >
	
		--%><g:hiddenField id="mess" name="mess.id" value="${topicInstance?.firstMessage.id}" /><%--
		<g:hiddenField id="user" name="user" value="${userInstance?.id}" />
	--%><g:hiddenField optionKey="id" id="topic" name="topic.id" value="${topicInstance?.id}" /><%--
		<g:hiddenField id="mess" name="topic.id" value="${topicInstance?.messages[0]}" />
	--%></g:if>
</div>
<%--<div class="fieldcontain ${hasErrors(bean: userMessageInstance, field: 'mess', 'error')} ">
	<label for="mess">
		<g:message code="userMessage.mess.label" default="Mess" />
		
	</label>
	<g:select id="mess" name="mess.id" from="${segfault2.UserMessage.list()}" class="form-control" optionKey="id" value="${userMessageInstance?.mess?.id}" class="form-control" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userMessageInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="userMessage.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker class="form-control" name="date" precision="day"  value="${userMessageInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userMessageInstance, field: 'nbMoins', 'error')} required">
	<label for="nbMoins">
		<g:message code="userMessage.nbMoins.label" default="Nb Moins" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nbMoins" type="number" value="${userMessageInstance.nbMoins}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userMessageInstance, field: 'nbPlus', 'error')} required">
	<label for="nbPlus">
		<g:message code="userMessage.nbPlus.label" default="Nb Plus" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nbPlus" type="number" value="${userMessageInstance.nbPlus}" required=""/>

</div>

--%><%--<div class="fieldcontain ${hasErrors(bean: userMessageInstance, field: 'reponses', 'error')} ">
	<label for="reponses">
		<g:message code="userMessage.reponses.label" default="Reponses" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userMessageInstance?.reponses?}" var="r">
    <li><g:link controller="userMessage" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userMessage" action="create" params="['userMessage.id': userMessageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userMessage.label', default: 'UserMessage')])}</g:link>
</li>
</ul>


</div>

--%><%--<div class="fieldcontain ${hasErrors(bean: userMessageInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="userMessage.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select class="form-control" id="topic" name="topic.id" from="${segfault2.Topic.list()}" optionKey="id" required="" value="${userMessageInstance?.topic?.id}" />

</div>

--%>