
<%@ page import="process.TeamMember" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="projectContent" />
</head>

<body>

<section id="show-teamMember" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="teamMember.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: teamMemberInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="teamMember.soeId.label" default="Soe Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: teamMemberInstance, field: "soeId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="teamMember.role.label" default="Role" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: teamMemberInstance, field: "role")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="teamMember.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: teamMemberInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="teamMember.projects.label" default="Projects" /></td>
				
				<td valign="top" class="value"><g:link controller="project" action="show" id="${teamMemberInstance?.projects?.id}">${teamMemberInstance?.projects?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
