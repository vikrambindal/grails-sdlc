
<%@ page import="process.Project" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-project" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="project.code.label" default="Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: projectInstance, field: "code")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="project.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: projectInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="project.tasks.label" default="Tasks" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${projectInstance.tasks}" var="t">
						<li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="project.teamMembers.label" default="Team Members" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${projectInstance.teamMembers}" var="t">
						<li><g:link controller="teamMember" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
