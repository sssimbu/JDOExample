package com.jdo.crud;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String email = request.getParameter("email");

		String Mobile = request.getParameter("Mobile");

		String Age = request.getParameter("Age");
		String Salary = request.getParameter("Salary");

		System.out.println("entered value is::" + name + "" + email + "" + Mobile + "" + Age + "" + Salary);

		Employee Emp = new Employee(name, email, Mobile, Age, Salary);

		PersistenceManager pm = PMF.get().getPersistenceManager();

		try {
			pm.makePersistent(Emp);
		} finally {
			pm.close();
		}

		response.sendRedirect("show.jsp");
		out.println("registered successfully");

	}

}
