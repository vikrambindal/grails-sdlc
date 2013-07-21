package process

class TaskEffort {

	TeamMember name;
	String role;
	Date actualStartDate;
	Date actualEndDate;
	static belongsTo = [subTasks: SubTask];
	
    static constraints = {
		name(blank:false);
		role(blank:false, inList: ['Coder', 'Tester']);
		actualStartDate(blank:false);
		actualEndDate(blank:false);
    }
	
	@Override
	public String toString() {
		return name;
	}
}
