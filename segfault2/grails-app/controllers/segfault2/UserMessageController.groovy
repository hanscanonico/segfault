package segfault2
import java.security.Principal;
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserMessageController {
	def springSecurityService;
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserMessage.list(params), model:[userMessageInstanceCount: UserMessage.count()]
    }

    def show(UserMessage userMessageInstance) {
        respond userMessageInstance
    }

    def create() {
		UserMessage message=new UserMessage(params)
		
		
		def testUser = new SecUser(username: 'user2', enabled: true, password: 'user2')
		message.user=testUser;
        respond message
    }
	
	@Secured(['ROLE_ADMIN','ROLE_USER'])
	def addComment() {
		
		Topic topicInstance=Topic.get(params.topicId);
	//	SpringSecurityService springSecurityService;
		
		//respond topicInstance;
	
//		if(topicInstance==null)
//			topicInstance = Topic.getAll().toArray()[0];
//		
			//respond topicInstance;
		
		render(view: 'addComment', model:[topicInstance: topicInstance,userInstance:springSecurityService.principal])
		//respond new UserMessage(params)
	}
	
    @Transactional
    def save(UserMessage userMessageInstance) {
		
        if (userMessageInstance == null) {
            notFound()
            return
        }

        if (userMessageInstance.hasErrors()) {
            respond userMessageInstance.errors, view:'create'
            return
        }
		
		SecUser user=SecUser.get(springSecurityService.currentUser.id)
		userMessageInstance.user=user;
		userMessageInstance.date=new Date();
        userMessageInstance.save flush:true
		Topic topicInstance=Topic.get(userMessageInstance.topic.id);
	//	redirect topicInstance;
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userMessage.label', default: 'UserMessage'), userMessageInstance.id])
                redirect topicInstance;
            }
            '*' { respond topicInstance, [status: CREATED] }
		
        }
    }

    def edit(UserMessage userMessageInstance) {
        respond userMessageInstance
    }

    @Transactional
    def update(UserMessage userMessageInstance) {
        if (userMessageInstance == null) {
            notFound()
            return
        }

        if (userMessageInstance.hasErrors()) {
            respond userMessageInstance.errors, view:'edit'
            return
        }

        userMessageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserMessage.label', default: 'UserMessage'), userMessageInstance.id])
                redirect userMessageInstance
            }
            '*'{ respond userMessageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserMessage userMessageInstance) {

        if (userMessageInstance == null) {
            notFound()
            return
        }

        userMessageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserMessage.label', default: 'UserMessage'), userMessageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userMessage.label', default: 'UserMessage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
