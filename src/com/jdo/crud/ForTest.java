package com.jdo.crud;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

public class ForTest {	

	PersistenceManager pm = PMF.get().getPersistenceManager();

	public List<Employee> testAge(String Age) {

		// PersistenceManager pm = PMF.get().getPersistenceManager();
		// Query q1 = pm.newQuery("SELECT FROM "+ Employee.class.getName() +"
		// WHERE Age=="+ Age);
		// q1.execute(Age);
		Query q1 = pm.newQuery(Employee.class, "Age==age");
		q1.declareParameters("String age");

		List<Employee> results = (List<Employee>) q1.execute(Age);
		return results;

		/*
		 * for (Employee print : results){
		 * 
		 * System.out.println(print.getName()+print.getAge()+print.getMobile()+
		 * print.getEmail()); }
		 * 
		 * System.out.println("q1 value:"+q1.toString());
		 */
	}

	public List<Employee> testSalary(String Salary) {
		Query q1 = pm.newQuery(Employee.class, "Salary==salary");
		q1.declareParameters("String salary");
		List<Employee> results = (List<Employee>) q1.execute(Salary);

		return results;

	}


	
	
	
	public List<Employee> testAgeSalary(String Age,String Salary) {
		System.out.println("inside of testAgeSalary method ");
		Query q1 = pm.newQuery(Employee.class, "Salary==salary && Age==age");
		q1.declareParameters("String salary,String age");
		//q1.declareParameters("");

		List<Employee> results = (List<Employee>) q1.execute(Salary,Age);

		return results;

	}
}
