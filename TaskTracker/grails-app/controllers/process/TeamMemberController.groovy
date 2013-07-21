package process

import org.springframework.dao.DataIntegrityViolationException

/**
 * TeamMemberController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class TeamMemberController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [teamMemberInstanceList: TeamMember.list(params), teamMemberInstanceTotal: TeamMember.count()]
    }

    def create() {
        [teamMemberInstance: new TeamMember(params)]
    }

    def save() {
        def teamMemberInstance = new TeamMember(params)
        if (!teamMemberInstance.save(flush: true)) {
            render(view: "create", model: [teamMemberInstance: teamMemberInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'teamMember.label', default: 'TeamMember'), teamMemberInstance.id])
        redirect(action: "show", id: teamMemberInstance.id)
    }

    def show() {
        def teamMemberInstance = TeamMember.get(params.id)
        if (!teamMemberInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamMember.label', default: 'TeamMember'), params.id])
            redirect(action: "list")
            return
        }

        [teamMemberInstance: teamMemberInstance]
    }

    def edit() {
        def teamMemberInstance = TeamMember.get(params.id)
        if (!teamMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamMember.label', default: 'TeamMember'), params.id])
            redirect(action: "list")
            return
        }

        [teamMemberInstance: teamMemberInstance]
    }

    def update() {
        def teamMemberInstance = TeamMember.get(params.id)
        if (!teamMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamMember.label', default: 'TeamMember'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (teamMemberInstance.version > version) {
                teamMemberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'teamMember.label', default: 'TeamMember')] as Object[],
                          "Another user has updated this TeamMember while you were editing")
                render(view: "edit", model: [teamMemberInstance: teamMemberInstance])
                return
            }
        }

        teamMemberInstance.properties = params

        if (!teamMemberInstance.save(flush: true)) {
            render(view: "edit", model: [teamMemberInstance: teamMemberInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'teamMember.label', default: 'TeamMember'), teamMemberInstance.id])
        redirect(action: "show", id: teamMemberInstance.id)
    }

    def delete() {
        def teamMemberInstance = TeamMember.get(params.id)
        if (!teamMemberInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamMember.label', default: 'TeamMember'), params.id])
            redirect(action: "list")
            return
        }

        try {
            teamMemberInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'teamMember.label', default: 'TeamMember'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'teamMember.label', default: 'TeamMember'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
