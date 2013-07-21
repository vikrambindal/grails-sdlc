package process

class Project {

	String name;
	String code;
	
	static hasMany = [teamMembers:TeamMember, tasks:Task]
	
    static constraints = {
		code (blank:false);
		name (blank:false);
    }
	
	@Override
	public String toString() {
		return name;
	}
}
