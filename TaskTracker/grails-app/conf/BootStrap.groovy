import process.Project
import process.TeamMember

class BootStrap {

    def init = { servletContext ->
		def Project project = new Project(name:'MarketRisk Limit Central', code:'001').save(flushOnError:true);
		def TeamMember t1 = new TeamMember(name:'Vikram', soeId:'001_FS', role:'Lead', projects:project).save(flushOnError:true);
		def TeamMember t2 = new TeamMember(name:'Bhaskar', soeId:'002_FS', role:'Developer', projects:project).save(flushOnError:true);
		def TeamMember t3 = new TeamMember(name:'Sandeepa', soeId:'003_FS', role:'Developer', projects:project).save(flushOnError:true);
		def TeamMember t4 = new TeamMember(name:'Prabhjot', soeId:'004_FS', role:'ONC', projects:project).save(flushOnError:true);
    }
    def destroy = {
    }
}
