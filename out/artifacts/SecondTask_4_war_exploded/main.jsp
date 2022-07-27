<%@ page import="kz.bitlab.db.Task" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossorigin="anonymous"></script>
  <title>Title</title>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-12">
      <%@include file="navbar.jsp"%>
    </div>
  </div>
</div>


<div class="container">
  <div class="row">
    <div class="mt-3">
      <form action="/apply" method="post">
      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
        ADD TASK
      </button>
      <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel">NEW TASK</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <div class="row mt-3">
                <div class="col-12">
                  <label>NAMED TASK:</label>
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-12">
                  <input type="text" class="form-control" name="task_named" required placeholder="INSERT TASK NAME">
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-12">
                  <label>DESCRIPTION:</label>
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-12">
                  <textarea class="form-control" name="task_description" rows="3" placeholder="INSERT DEAD LINE DATE" ></textarea>
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-12">
                  <label>DEAD LINE:</label>
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-12">
                  <input type="date" class="form-control" name="task_deadline" required placeholder="INSERT DEAD LINE">
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-12">
                  <label>DONE :</label>
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-12">
                  <select class="form-control" name="task_done">
                    <option>NO</option>
                    <option>YES</option>
                  </select>
                </div>
              </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button  class="btn btn-primary">ADD TASK</button>
            </div>
          </div>
        </div>
      </div>
    </div>
      </form>
  </div>
</div>
</div>






<div class="row mt-3">
  <div class="col-10 mx-auto">
    <table class="table table-striped table-hover">
      <thead>
      <th>ID</th>
      <th>Наименование</th>
      <th>Крайний срок</th>
      <th>Выполнено</th>
      <th>Детали</th>
      </thead>
      <tbody>
      <%
        ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("any");
        if (tasks!=null){

          for (Task tsk: tasks){
      %>
      <tr>
        <td><%=tsk.getId()%></td>
        <td><%=tsk.getName()%></td>
        <td><%=tsk.getDeadlineDate()%></td>
        <td><%=tsk.getDone()%></td>
        <td><a href="/details?id=<%=tsk.getId()%>" class="btn btn-info btn-sm">DETAILS</a> </td>
      </tr>
      <%

          }
        }
      %>
      </tbody>
    </table>
  </div>
</div>
</div>
</body>
</html>
