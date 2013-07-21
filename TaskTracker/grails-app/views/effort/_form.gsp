<%@ page import="process.Effort" %>



			<div class="control-group fieldcontain ${hasErrors(bean: effortInstance, field: 'actualStartDate', 'error')} required">
				<label for="actualStartDate" class="control-label"><g:message code="effort.actualStartDate.label" default="Actual Start Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="actualStartDate" precision="day"  value="${effortInstance?.actualStartDate}"  />
					<span class="help-inline">${hasErrors(bean: effortInstance, field: 'actualStartDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: effortInstance, field: 'actualEndDate', 'error')} required">
				<label for="actualEndDate" class="control-label"><g:message code="effort.actualEndDate.label" default="Actual End Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="actualEndDate" precision="day"  value="${effortInstance?.actualEndDate}"  />
					<span class="help-inline">${hasErrors(bean: effortInstance, field: 'actualEndDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: effortInstance, field: 'phase', 'error')} required">
				<label for="phase" class="control-label"><g:message code="effort.phase.label" default="Phase" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select name="phase" from="${effortInstance.constraints.phase.inList}" required="" value="${effortInstance?.phase}" valueMessagePrefix="effort.phase"/>
					<span class="help-inline">${hasErrors(bean: effortInstance, field: 'phase', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: effortInstance, field: 'task', 'error')} required">
				<label for="task" class="control-label"><g:message code="effort.task.label" default="Task" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="task" name="task.id" from="${process.Task.list()}" optionKey="id" required="" value="${effortInstance?.task?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: effortInstance, field: 'task', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: effortInstance, field: 'teamMember', 'error')} required">
				<label for="teamMember" class="control-label"><g:message code="effort.teamMember.label" default="Team Member" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="teamMember" name="teamMember.id" from="${process.TeamMember.list()}" optionKey="id" required="" value="${effortInstance?.teamMember?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: effortInstance, field: 'teamMember', 'error')}</span>
				</div>
			</div>

