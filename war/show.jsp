<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.jdo.crud.*"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.jdo.Query"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.jdo.crud.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>show</title>
</head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>





<!-- Modal page -->


  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Sort By Age & Salary</h4>
        </div>
        <div class="modal-body">
        <form action="show.jsp">
                  <select name="Age">
						<option>Age</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="25">25</option>
						<option value="30">30</option>
					</select>
        
        
              <select name="Salary">
						<option>Salary</option>
						<option value="10000">10K</option>
						<option value="20000">20K</option>
						<option value="30000">30K</option>
						<option value="40000">40K</option>
						<option value="50000">50K</option>
					</select>
					
					<input  type=submit value=Submit>
        
        </form>
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  


<!--modal page  -->


<button class="btn btn-info btn-lg" type="button"  data-toggle="modal" data-target="#myModal">Filter By Age & Salary</button>
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>
				<form action="show.jsp">
					<select name="Age" onchange='this.form.submit()'>
						<option>Age</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="25">25</option>
						<option value="30">30</option>
					</select>
			</th>
			<noscript>
				<input type="submit" value="Submit">
			</noscript>
			</form>


			<th>
				<form action="show.jsp">
					<select name="Salary" onchange='this.form.submit()'>
						<option>Salary</option>
						<option value="10000">10K</option>
						<option value="20000">20K</option>
						<option value="30000">30K</option>
						<option value="40000">40K</option>
						<option value="50000">50K</option>
					</select>
			</th>
			<noscript>
				<input type="submit" value="Submit">
			</noscript>
			</form>

		</tr>

		<%
			System.out.println("showjsp running");
			/* 
			String query="select from"+Employee.class.getName();
			PersistenceManager pm = PMF.get().getPersistenceManager();
			
			List<Employee> newobj=(List<Employee>)pm.newQuery(query).execute(); */
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Query q = pm.newQuery(Employee.class);

			String Age = request.getParameter("Age");
			String Salary = request.getParameter("Salary");
			
		
			
			
			
			q.setOrdering("name Asc");

			try {

				
				
				/* request.setAttribute("Age", Age);
				request.getAttribute(Age); */

				
				System.out.println("Age value:"+Age);
				System.out.println("Salary value:"+Salary);

				
				
				
				
	if (Age!=null && Salary!=null) {
					
					
					//ForTest.test(Age);
					
					//Query q1 = pm.newQuery("SELECT FROM "+ Employee.class.getName() +" WHERE Age=="+ Age);
					
					
				   /* 	System.out.println("inside of age");
					System.out.println(q1.toString()); */

					//que.setFilter("Age == value");
					//que.declareParameters("String value");
					//q1.execute(Age);
							//List<results> results1 = (List<results>) q1.execute(Age);
                     
					ForTest obj=new ForTest();
                                            
                      List<Employee> results3 = (List<Employee>)obj.testAgeSalary(Age,Salary);					
					
                      
                      if (!results3.isEmpty()) {
						for (Employee print : results3) {
		%>
		<tr>
			<td><%=print.getName()%></td>
			<td><%=print.getEmail()%></td>
			<td><%=print.getMobile()%></td>
			<td><%=print.getAge()%></td>
			<td><%=print.getSalary()%></td>

		</tr>
		<%
			}
					} else {
						// Handle "no results" case
		%>
		<script>
			window.alert('No results');
		</script>
		<%
			}

				} 
				
				
				
				
				
				
				
				
				
	else if (Age != null) {
					
					
					//ForTest.test(Age);
					
					//Query q1 = pm.newQuery("SELECT FROM "+ Employee.class.getName() +" WHERE Age=="+ Age);
					
					
				   /* 	System.out.println("inside of age");
					System.out.println(q1.toString()); */

					//que.setFilter("Age == value");
					//que.declareParameters("String value");
					//q1.execute(Age);
							//List<results> results1 = (List<results>) q1.execute(Age);
                      ForTest obj=new ForTest();
                                            
                      List<Employee> results1 = (List<Employee>)obj.testAge(Age);					
					
                      
                      if (!results1.isEmpty()) {
						for (Employee print : results1) {
		%>
		<tr>
			<td><%=print.getName()%></td>
			<td><%=print.getEmail()%></td>
			<td><%=print.getMobile()%></td>
			<td><%=print.getAge()%></td>
			<td><%=print.getSalary()%></td>

		</tr>
		<%
			}
					} else {
						// Handle "no results" case
		%>
		<script>
			window.alert('No results');
		</script>
		<%
			}

				} else if (Salary != null) {
			/* 		System.out.println("inside of Salary");
					q.setFilter("Salary == value");
					q.declareParameters("String value");
					q.execute(Salary); */
                    ForTest obj=new ForTest();
                    List<Employee> results2 = (List<Employee>)obj.testSalary(Salary);					


					//List<Employee> results = (List<Employee>) q.execute(Salary);

					if (!results2.isEmpty()) {
						for (Employee print : results2) {
		%>
		<tr>
			<td><%=print.getName()%></td>
			<td><%=print.getEmail()%></td>
			<td><%=print.getMobile()%></td>
			<td><%=print.getAge()%></td>
			<td><%=print.getSalary()%></td>

		</tr>
		<%
			}
					} else {
						// Handle "no results" case
		%>
		<script>
			window.alert('No results');
		</script>

		<%
			}

				}

				else {
					List<Employee> results = (List<Employee>) q.execute();

					if (!results.isEmpty()) {
						for (Employee print : results) {
		%>
		<tr>
			<td><%=print.getName()%></td>
			<td><%=print.getEmail()%></td>
			<td><%=print.getMobile()%></td>
			<td><%=print.getAge()%></td>
			<td><%=print.getSalary()%></td>

		</tr>
		<%
			}
					} else {
						// Handle "no results" case
		%>
		<script>
			window.alert('No results');
		</script>

		<%
			}
				}
			} finally {
				q.closeAll();
			}
		%>

		<!--  for(Employee obj:newobj)
{

	
	obj.getName()
	
	
	
}  -->
</body>
</html>