<!DOCTYPE html>
<html lang="en">

  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'portfolio-item.css')}" type="text/css">
 <g:layoutHead/>
  </head>
<body>
 <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${createLink(uri: '/')}">Segfault</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                  <li>
                  	<a role = "presentation" class="active" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                  </li>
				  <li>
				  
				  	<a class="" href="${createLink(controller: 'tag')}">Tag</a>
				  </li>
				   <sec:ifLoggedIn>
				    <li>
				  		<a class="" href="${createLink(controller: 'badge')}">Badges</a>
				    </li>
				   </sec:ifLoggedIn>
				       </ul>
				         <ul class="nav navbar-nav navbar-right">
				          
				   <sec:ifLoggedIn>
				   <li>
				  	  <g:remoteLink class="logout" controller="logout" method="post" asynchronous="false" onSuccess="location.reload()">Logout</g:remoteLink>
					 </li>

					 <li class="dropdown open">
					  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">My account <span class="caret"></span></a>
					   <ul class="dropdown-menu"> 
					   	
					   		<li>
					   			<g:link controller="user" action="index">Profil</g:link>
					   		</li> 
					   		<%--<li>
					   			<a href="#">Something else here</a>
					   		</li> <li role="separator" class="divider"></li> 
					   		<li>
					   			<a href="#">Separated link</a></li>
					   		 <li role="separator" class="divider"></li> 
					   		 <li>
					   		 	<a href="#">One more separated link</a>
					   		 </li> 
					   --%></ul> 
					 </li>
					</sec:ifLoggedIn>
					<sec:ifNotLoggedIn>
			
						<li>
							<g:link controller="login" action="auth">Login</g:link>
						</li>
							<%--<a class="" href="${createLink(controller: 'login' ,action : 'auth')}">Login</a>--%>
						<li>
								<g:link controller="register"  >Register</g:link>
						</li>
					</sec:ifNotLoggedIn>
				 
				  </ul>
            
            </div>

            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <g:layoutBody/>
  
	 <div class="navbar navbar-default navbar-fixed-bottom">
		 <div class="container">
		 	<p class="navbar-text">Site by Hans Canonico and Amine Belkedah</p>
		 </div>
   	 </div>
</body>
    <!-- Page Content -->
   
    <!-- /.container -->

    <!-- jQuery -->
<script src="${resource(dir: 'js', file: 'jquery.js')}"></script>	
<script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>			
		


</html>