package process

class Phase {

	String taskPhase;
	
    static constraints = {
		taskPhase (blank:false, inList:['Requirments', 'Analysis', 'Design', 'Review', 'Unit Test']);
    }
	
	public String toString() {
		return taskPhase;
	}
}
