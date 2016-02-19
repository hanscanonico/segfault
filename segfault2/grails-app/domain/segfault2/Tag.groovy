package segfault2

class Tag {
	String titre;
	
	public Tag(){
		//topics=new ArrayList();
	}
	
	@Override
	public String toString() {
		return titre;
	}
	static hasMany = [topics: Topic]
	static constraints = {
	}
}
