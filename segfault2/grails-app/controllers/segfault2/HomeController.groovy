package segfault2

class HomeController {

    def index() {
		def List topics=Topic.getAll()
		
			//	return topics
		return [topics : topics]
	}
	
	
}
