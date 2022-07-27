<%@ page import="kz.bitlab.db.Task" %>

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
  <div class="row mt-3">
    <div class="col-6 mx-auto">
      <%
        Task task = (Task) request.getAttribute("task");
        if (task!= null){
      %>
      <form action="/update" method="post">
        <input type="hidden" class="form-control" name="task_id"  value="<%=task.getId()%>">
        <div class="row mt-3">
          <div class="col-12">
            <label>NAMED TASK:</label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <input type="text" class="form-control" name="task_named"  value="<%=task.getName()%>">
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>TASK DESCRIPTION: </label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <textarea class="form-control" name="task_description" rows="3" ><%=task.getDescription()%></textarea>
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>TASK DONE:</label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <select class="form-control" name="task_done" value="<%=task.getDone()%>">
              <option></option>
              <option>YES</option>
              <option>NO</option>
            </select>
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>DEAD LINE:</label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <input type="date" class="form-control" name="task_deadline"  value="<%=task.getDeadlineDate()%>">
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <button class="btn btn-success">UPDATE TASK</button>
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteStudentModal">DELETE TASK</button>
          </div>
        </div>
      </form>
      <%
        }
      %>



      <div class="modal fade" id="deleteStudentModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form action="/delete" method="post">
              <input type="hidden" class="form-control" name="id"  value="<%=task.getId()%>">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel">Confirm delete</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
             Are you sure?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
              <button class="btn btn-danger">YES</button>
            </div>
            </form>
          </div>
        </div>
      </div>


    </div>
  </div>
</div>
</body>
</html>

