package process

class SubTask {

	Date plannedStartDate;
	Date plannedEndDate;
	
	static belongsTo = [tasks:Task];
	static hasMany = [taskEfforts: TaskEffort, phases: Phase];
	
    static constraints = {
		plannedStartDate(blank:false);
		plannedEndDate(blank:false);
    }
	
	@Override
	public String toString() {
		return phases;
	}
}
