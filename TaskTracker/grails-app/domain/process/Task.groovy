package process

class Task {

	String taskId;
	String taskName;
	Date plannedStartDate;
	Date plannedEndDate;
	String priority;
	
	static belongsTo = [projects:Project];
	static hasMany = [subTasks:SubTask, efforts:Effort];
	
    static constraints = {
		taskId( blank:false);
		taskName( blank: false);
		plannedStartDate( blank:false);
		plannedEndDate( blank:false);
		priority( inList: ['Critical', 'Major', 'Medium', 'Low']);
    }
	
	@Override
	public String toString() {
		return taskName;
	}
}
