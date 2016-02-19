package segfault2

class Badge {
	
	String titre;
	
	static hasMany = [utilisateurs: SecUser]
	static belongsTo = SecUser

	static constraints = {
		//utilisateurs nullable:true;
	}
}
