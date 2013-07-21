package process

class TeamMember {

	String name;
	String soeId;
	String email;
	String role;
	
	static belongsTo = [projects:Project]
	
    static constraints = {
		name(blank:false);
		soeId(blank:false);
		role(blank:false, inList: ['Developer', 'Lead', 'ONC', 'Tester']);
    }
	
	@Override
	public String toString() {
		return name;
	}
}
