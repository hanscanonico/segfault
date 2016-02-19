package segfault2

import java.util.Date;

class UserMessage {
	String texte;
	Date date;
	int nbMoins;
	int nbPlus;
	int note;
	static belongsTo = [topic:Topic,mess:UserMessage,user:SecUser]

	static hasMany = [reponses: UserMessage]
	
	@Override
	public String toString() {
		return texte;
	}

	
	static constraints = {
		texte blank: false, size: 1..1000
		mess nullable : true
		user nullable : true
		reponses nullable : true
		topic nullable : true
		date nullable : true
	}
	
}
