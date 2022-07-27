package kz.bitlab.servlets;

import kz.bitlab.db.DBManager;
import kz.bitlab.db.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{

    }
    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
        Long id = Long.parseLong(request.getParameter("id"));
        Task task = DBManager.getTask(id);
        if (task!=null){
            request.setAttribute("task",task);
            request.getRequestDispatcher("/details.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("/404.jsp").forward(request, response);
        }
    }
}
