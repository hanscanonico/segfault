package segfault2



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.SpringSecurityService;
import grails.plugin.springsecurity.annotation.Secured
@Transactional(readOnly = true)
class TopicController {
	SpringSecurityService springSecurityService;
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Topic.list(params), model:[topicInstanceCount: Topic.count()]
    }

    def show(Topic topicInstance) {
		topicInstance.messages=topicInstance.messages.sort{
			-it.note;
		}
        respond topicInstance
    }
	
	@Secured(['ROLE_ADMIN','ROLE_USER'])
	def upComment() {

		String[] values=params.values.split('#');
		
		Topic topicInstance=Topic.get(values[0]);
		UserMessage userMessageInstance=UserMessage.get(values[1]);
		userMessageInstance.nbPlus++;
		userMessageInstance.note++;
		userMessageInstance.save flush:true
		redirect action: "show",id: topicInstance.id, method:"GET"
	}
	
	@Secured(['ROLE_ADMIN','ROLE_USER'])
	def downComment() {
	String[] values=params.values.split('#');
		
		Topic topicInstance=Topic.get(values[0]);
		UserMessage userMessageInstance=UserMessage.get(values[1]);
		userMessageInstance.nbMoins--;
		userMessageInstance.note--;
		userMessageInstance.save flush:true
		redirect action: "show",id: topicInstance.id, method:"GET"
	}
	
	
	def addComment() {
	
	}
	

	@Secured(["ROLE_USER","ROLE_ADMIN"])
    def create() {
		Topic topic=new Topic(params);
	//	UserMessage mess=new UserMessage(texte:' hans');
//		def list = [mess]
//		topic.messages=list;
		respond topic;
    }

    @Transactional
    def save(Topic topicInstance) {
		
        if (topicInstance == null) {
            notFound()
            return
        }
		
		

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'create'
            return
        }
		//topicInstance.date=new Date();
		println "messagess : "+topicInstance.messages;
		println "messagess 2 : "+topicInstance.firstMessage;
		println "messagess 2 : "+topicInstance.titre;
        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*' { respond topicInstance, [status: CREATED] }
        }
    }

    def edit(Topic topicInstance) {
        respond topicInstance
    }

    @Transactional
    def update(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'edit'
            return
        }
		topicInstance.date=new Date();
        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*'{ respond topicInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Topic topicInstance) {

        if (topicInstance == null) {
            notFound()
            return
        }

        topicInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
