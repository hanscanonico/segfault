import java.text.DateFormat;

import segfault2.SecRole
import segfault2.SecUser
import segfault2.SecUserSecRole
import segfault2.Topic
import segfault2.Tag
import segfault2.UserMessage
class BootStrap {

    def init = { servletContext ->
		
		def userRole =  new SecRole(authority: 'ROLE_USER').save(flush: true)
		def adminRole = new SecRole(authority: 'ROLE_ADMIN').save(flush: true)
		Date today = new Date();
			def testUser = new SecUser(username: 'admin', enabled: true, password: 'admin',accountLocked: false, passwordExpired: false, accountExpired: false)
		def testUser2 = new SecUser(username: 'user', enabled: true, password: 'user',accountLocked: false, passwordExpired: false, accountExpired: false)
		def testUser3 = new SecUser(username: 'Amine', enabled: true, password: 'user',accountLocked: false, passwordExpired: false, accountExpired: false)
		testUser.save(flush: true);
		testUser2.save(flush:true);
		testUser3.save(flush:true);
		SecUserSecRole.create testUser, adminRole, true
		SecUserSecRole.create testUser2, userRole, true
		
		
	
		def topic1 = new Topic(titre: 'A quoi sert la méthode Livre() ?',date:today)
		def topic2 = new Topic(titre: ' Le JavaScript est il compilé ?',date:today)
		def topic3 = new Topic(titre: 'Pourquoi le garbage collector est il bien ?',date:today)
		
		
		topic1.save(flush:true);
		topic2.save(flush:true);
		topic3.save(flush:true);
		 
		def tag1 = new Tag(titre: 'Java').addToTopics(topic3);

		//def mess1=new UserMessage(texte:'fazfcaqfczaqcfza');
		//topic1.addToMessages(mess1);
		topic3.firstMessage=new UserMessage(texte:'Bonjour lol, jaure aime pourquoi cest bien et aussi c quoi',date:today,user:testUser3  );
		def tag2 = new Tag(titre: 'C#').addToTopics(topic1);//.addToMessages(texte:'C quoi la methode Livre() dans le rectangle ?????' )
	
		
		topic1.firstMessage=new UserMessage(texte:'C quoi la methode Livre() dans le rectangle ?????',date:today,user:testUser3  );
		
		UserMessage mess=new UserMessage(texte:'Vu que y a Java dans JavaScript c compile ???',date:today,user:testUser3 )
		topic2.firstMessage=mess;
		def tag3 = new Tag(titre: 'JavaScript').addToTopics(topic2);//
		
	//	mess.save();
		//mess.user=testUser3;
		
		def tag4 = new Tag(titre: 'C++')
		def tag5 = new Tag(titre: 'Scheme')
		
		tag1.save(flush:true);
		tag2.save(flush:true);
		tag3.save(flush:true);
		tag4.save(flush:true);
		tag5.save(flush:true);
		//mess.user=testUser3;
		}
	
	    def destroy = {
	    }
}
