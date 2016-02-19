<html>
	<head>
		<meta name="layout" content="jarvis"/>
		<s2ui:title messageCode='spring.security.ui.register.title'/>
	</head>
	<body>	
		<div class="container bs-docs-container">
			<s2ui:formContainer type='register' focus='username' width='800px'>
				<s2ui:form beanName='registerCommand'>
					<g:if test='${emailSent}'>
					<br/>
					<g:message code='spring.security.ui.register.sent'/>
					</g:if>
					<g:else>
					<br/>
					<table>
					<tbody>
						<s2ui:textFieldRow class="form-control" name='username' size='40' labelCodeDefault='Username'/>
						<s2ui:textFieldRow class="form-control" name='email' size='40' labelCodeDefault='E-mail'/>
						<s2ui:passwordFieldRow class="form-control"  name='password' size='40' labelCodeDefault='Password'/>
						<s2ui:passwordFieldRow class="form-control"  name='password2' size='40' labelCodeDefault='Password (again)'/>
					</tbody>
					</table>
					<g:submitButton class="btn btn-primary" elementId='submit' name='Validate' messageCode='spring.security.ui.register.submit'/>
					</g:else>
				</s2ui:form>
			</s2ui:formContainer>
		</div>
	</body>
</html>
