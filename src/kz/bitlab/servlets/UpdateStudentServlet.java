package kz.bitlab.servlets;


import kz.bitlab.db.DBManager;
import kz.bitlab.db.Task;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/update")
public class UpdateStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response){

    }
    protected void doPost (HttpServletRequest request,HttpServletResponse response) throws IOException {
        String redirect = "/";

        String named = request.getParameter("task_named");
        String description = request.getParameter("task_description");
        String deadLine = request.getParameter("task_deadline");
        String done = request.getParameter("task_done");
        Long id = Long.parseLong(request.getParameter("task_id"));

        Task task = DBManager.getTask(id);
        if (task!=null){
            task.setId(id);
            task.setName(named);
            task.setDescription(description);
            task.setDeadlineDate(deadLine);
            task.setDone(done);
            DBManager.update(task);
            redirect = "/details?id="+id;
        }
        response.sendRedirect(redirect);
    }
}