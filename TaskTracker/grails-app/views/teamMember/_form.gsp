<%@ page import="process.TeamMember" %>



			<div class="control-group fieldcontain ${hasErrors(bean: teamMemberInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="teamMember.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${teamMemberInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: teamMemberInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: teamMemberInstance, field: 'soeId', 'error')} required">
				<label for="soeId" class="control-label"><g:message code="teamMember.soeId.label" default="Soe Id" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="soeId" required="" value="${teamMemberInstance?.soeId}"/>
					<span class="help-inline">${hasErrors(bean: teamMemberInstance, field: 'soeId', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: teamMemberInstance, field: 'role', 'error')} required">
				<label for="role" class="control-label"><g:message code="teamMember.role.label" default="Role" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select name="role" from="${teamMemberInstance.constraints.role.inList}" required="" value="${teamMemberInstance?.role}" valueMessagePrefix="teamMember.role"/>
					<span class="help-inline">${hasErrors(bean: teamMemberInstance, field: 'role', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: teamMemberInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="teamMember.email.label" default="Email" /></label>
				<div class="controls">
					<g:textField name="email" value="${teamMemberInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: teamMemberInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: teamMemberInstance, field: 'projects', 'error')} required">
				<label for="projects" class="control-label"><g:message code="teamMember.projects.label" default="Projects" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="projects" name="projects.id" from="${process.Project.list()}" optionKey="id" required="" value="${teamMemberInstance?.projects?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: teamMemberInstance, field: 'projects', 'error')}</span>
				</div>
			</div>

