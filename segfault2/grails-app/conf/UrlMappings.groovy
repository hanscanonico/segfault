class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

       // "/" (view:"/index")
		"/"(controller:'home')
		"/topic/index"(controller:'home')
		"/home/create"(controller:'topic',action:'create')
        "500"(view:'/error')
		
		
	}
}
