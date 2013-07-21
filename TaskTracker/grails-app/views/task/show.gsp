
<%@ page import="process.Task" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="projectContent" />
	<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
</head>

<body>

<section id="show-task" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="task.taskId.label" default="Task Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: taskInstance, field: "taskId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="task.taskName.label" default="Task Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: taskInstance, field: "taskName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="task.plannedStartDate.label" default="Planned Start Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${taskInstance?.plannedStartDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="task.plannedEndDate.label" default="Planned End Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${taskInstance?.plannedEndDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="task.offshore.label" default="Offshore" /></td>
				
				<td valign="top" class="value"><g:link controller="teamMember" action="show" id="${taskInstance?.offshore?.id}">${taskInstance?.offshore?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="task.onsite.label" default="Onsite" /></td>
				
				<td valign="top" class="value"><g:link controller="teamMember" action="show" id="${taskInstance?.onsite?.id}">${taskInstance?.onsite?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="task.comments.label" default="Comments" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: taskInstance, field: "comments")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="task.projects.label" default="Projects" /></td>
				
				<td valign="top" class="value"><g:link controller="project" action="show" id="${taskInstance?.projects?.id}">${taskInstance?.projects?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="task.subTasks.label" default="Sub Tasks" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${taskInstance.subTasks}" var="s">
						<li><g:link controller="subTask" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
