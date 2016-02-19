package segfault2
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured


class UserController {
	
	SpringSecurityService springSecurityService;
    def index() { 
		
		SecUser user=SecUser.get(springSecurityService.currentUser.id)
		def List messages=UserMessage.findAllWhere(user:user)
			//	return topics
		return [messages : messages]
	}
}
