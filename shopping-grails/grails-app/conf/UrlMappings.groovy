class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:'shop', action:'list')
		"/admin"(view:"/index")
//		"/"(view:"/index")
		"500"(view:'/error')
	}
}
