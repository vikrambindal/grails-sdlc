package process

import org.springframework.dao.DataIntegrityViolationException

/**
 * EffortController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class EffortController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [effortInstanceList: Effort.list(params), effortInstanceTotal: Effort.count()]
    }

    def create() {
        [effortInstance: new Effort(params)]
    }

    def save() {
        def effortInstance = new Effort(params)
        if (!effortInstance.save(flush: true)) {
            render(view: "create", model: [effortInstance: effortInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'effort.label', default: 'Effort'), effortInstance.id])
        redirect(action: "show", id: effortInstance.id)
    }

    def show() {
        def effortInstance = Effort.get(params.id)
        if (!effortInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'effort.label', default: 'Effort'), params.id])
            redirect(action: "list")
            return
        }

        [effortInstance: effortInstance]
    }

    def edit() {
        def effortInstance = Effort.get(params.id)
        if (!effortInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'effort.label', default: 'Effort'), params.id])
            redirect(action: "list")
            return
        }

        [effortInstance: effortInstance]
    }

    def update() {
        def effortInstance = Effort.get(params.id)
        if (!effortInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'effort.label', default: 'Effort'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (effortInstance.version > version) {
                effortInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'effort.label', default: 'Effort')] as Object[],
                          "Another user has updated this Effort while you were editing")
                render(view: "edit", model: [effortInstance: effortInstance])
                return
            }
        }

        effortInstance.properties = params

        if (!effortInstance.save(flush: true)) {
            render(view: "edit", model: [effortInstance: effortInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'effort.label', default: 'Effort'), effortInstance.id])
        redirect(action: "show", id: effortInstance.id)
    }

    def delete() {
        def effortInstance = Effort.get(params.id)
        if (!effortInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'effort.label', default: 'Effort'), params.id])
            redirect(action: "list")
            return
        }

        try {
            effortInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'effort.label', default: 'Effort'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'effort.label', default: 'Effort'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
