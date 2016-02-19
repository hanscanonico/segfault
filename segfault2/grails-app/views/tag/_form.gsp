<%@ page import="segfault2.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'titre', 'error')} required">
	<%--<label for="titre">
		<g:message code="tag.titre.label" default="Titre" />
		<span class="required-indicator">*</span>
	</label>--%>
	<%--<g:textField name="titre" required="" value="${tagInstance?.titre}"/>--%>
	<form>
	  <div class="form-group">
	    <label for="titre">Titre *</label>
	    <g:textField class="form-control" name="titre" required="" placeholder="Titre" value="${tagInstance?.titre}"/><%--
	   <input type="text" class="form-control" name="titre" id="titre" placeholder="Titre">
	  --%></div>
	
	 	</form>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'topics', 'error')} ">
	<label for="topics">
		<g:message code="tag.topics.label" default="Topics" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tagInstance?.topics?}" var="t">
    <li><g:link controller="topic" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="topic" action="create" params="['tag.id': tagInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'topic.label', default: 'Topic')])}</g:link>
</li>
</ul>


</div>
--%>
