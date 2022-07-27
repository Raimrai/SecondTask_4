package kz.bitlab.servlets;


import kz.bitlab.db.DBManager;
import kz.bitlab.db.Task;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/apply")
public class ApplyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response){

    }
    protected void doPost (HttpServletRequest request,HttpServletResponse response) throws IOException {
        String named = request.getParameter("task_named");
        String description = request.getParameter("task_description");
        String deadLine = request.getParameter("task_deadline");
        String done = request.getParameter("task_done");
        Task task = new Task();
        task.setName(named);
        task.setDescription(description);
        task.setDeadlineDate(deadLine);
        task.setDone(done);
        DBManager.addTask(task);
        response.sendRedirect("/home");
    }
}