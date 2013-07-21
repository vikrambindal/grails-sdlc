<%@ page import="process.Task" %>
<%@ page import="process.Effort" %>
	<script>
		function addRow(tableID) {
			var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
            var colCount = table.rows[0].cells.length;
            for(var i=0; i<colCount; i++) {
            	var newcell = row.insertCell(i);
            	newcell.innerHTML = table.rows[1].cells[i].innerHTML;
            }
		}

		function deleteRow(tableID) {
			try {
	            var table = document.getElementById(tableID);
	            var rowCount = table.rows.length;
	 
	            for(var i=0; i<rowCount; i++) {
	                var row = table.rows[i];
	                var chkbox = row.cells[0].childNodes[0];
	                if(null != chkbox && true == chkbox.checked) {
	                    if(rowCount <= 2) {
	                        alert("Cannot delete all the rows.");
	                        break;
	                    }
	                    table.deleteRow(i);
	                    rowCount--;
	                    i--;
	                }
	 
	            }
	            }catch(e) {
	            }
		}
	</script>
    <table class="table" style="height: 30px;">
		<tbody>
			<tr>
				<td style="width: 10%">
					<label for="taskId"><g:message code="task.taskId.label" default="TRACE ID" /></label>
					<g:textField name="taskId" required="" value="${taskInstance?.taskId}" style="width:50px;"/>
				</td>
				<td style="width: 35%">
					<label for="taskName"><g:message code="task.taskName.label" default="TASK NAME" /></label>
					<g:textField style="width:350px;" name="taskName" required="" value="${taskInstance?.taskName}"/>
				</td>
				<td style="width: 5%">
					<label for="offshore"><g:message code="task.offshore.label" default="PRIORITY" /></label>
					<g:select style="width:90px;" id="priority" name="priority" from="${taskInstance.constraints.priority.inList}" required="" value="${taskInstance?.priority}" class="many-to-one"/>
				</td>
				<td style="width: 50%">
					<label for="plannedStartDate"><g:message code="task.plannedStartDate.label" default="PLANNED DATES" /></label>
					<bs:datePicker name="plannedStartDate" precision="day"  value="${taskInstance?.plannedStartDate}"/>  - 
					<bs:datePicker name="plannedEndDate" precision="day"  value="${taskInstance?.plannedEndDate}"  />
				</td>				
			</tr>
		</tbody>
		</table>
    	<fieldset>
    	<legend>EFFORTS</legend>
    	<table class="table" id="effortTable">
    		<thead>
    			<tr>
    				<td><INPUT type="button" value="+" onclick="addRow('effortTable')" />
	 				    <INPUT type="button" value="X" onclick="deleteRow('effortTable')" /></td>
    				<td><g:message code="task.offshore.label" default="MEMBER" /></td>
    				<td><g:message code="task.offshore.label" default="PHASE" /></td>
    				<td><g:message code="task.offshore.label" default="ACTUAL DATES" /></td>
    				<td><g:message code="task.offshore.label" default="HOURS" /></td>
    				<td><g:message code="task.offshore.label" default="COMMENTS" /></td>
    			</tr>
    		</thead>
    		<tbody>
    			<tr>
    				<td wdith="10%" align="center"><INPUT type="checkbox" name="chk"/></td>
    				<td width="10%"><g:select style="width:120px;" id="teamMember" name="teamMember" from="${process.TeamMember.list()}" optionKey="id" required="" value="${effortInstance?.teamMember?.id}" class="many-to-one"/></td>
    				<td width="10%"><g:select style="width:120px;" id="phase" name="phase" from="${['Requirement', 'Analysis', 'Coding', 'Review', 'Testing']}" required="" value="${effortInstance?.phase}" class="many-to-one"/></td>
    				<td width="44%">
    					<bs:datePicker name="actualStartDate" precision="day"  value="${effortInstance?.actualStartDate}"/>  - 
						<bs:datePicker name="actualEndDate" precision="day"  value="${effortInstance?.actualEndDate}"  />
					</td>
    				<td width=6%><g:textField style="width:50px;" name="actualHrs" required="" value="${effortInstance?.actualHours}" /></td>
    				<td width=15%><g:textField style="width:150px;" name="comments" required="" value="${effortInstance?.comments}" /></td>
    			</tr>
    		</tbody>
    	</table>
    	</fieldset>
    
			

			

			

			

			

			

			

			

