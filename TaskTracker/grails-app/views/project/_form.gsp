<%@ page import="process.Project" %>



			<div class="control-group fieldcontain ${hasErrors(bean: projectInstance, field: 'code', 'error')} required">
				<label for="code" class="control-label"><g:message code="project.code.label" default="Code" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="code" required="" value="${projectInstance?.code}"/>
					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'code', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: projectInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="project.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${projectInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: projectInstance, field: 'tasks', 'error')} ">
				<label for="tasks" class="control-label"><g:message code="project.tasks.label" default="Tasks" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${projectInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'tasks', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: projectInstance, field: 'teamMembers', 'error')} ">
				<label for="teamMembers" class="control-label"><g:message code="project.teamMembers.label" default="Team Members" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${projectInstance?.teamMembers?}" var="t">
    <li><g:link controller="teamMember" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="teamMember" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'teamMember.label', default: 'TeamMember')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'teamMembers', 'error')}</span>
				</div>
			</div>

