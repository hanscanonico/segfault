package segfault2

class Topic {
	
	String titre;
	UserMessage firstMessage;
	Date date;
	static hasMany = [messages: UserMessage]
	static belongsTo = [tag:Tag]
	

	@Override
	public String toString() {
		return titre;
	}
	static constraints = {
		firstMessage nullable: true;
		date nullable : true;
		messages nullable : true;
	}
}
