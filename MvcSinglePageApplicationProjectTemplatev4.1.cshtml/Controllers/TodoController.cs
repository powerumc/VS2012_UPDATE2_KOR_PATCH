using System;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using $safeprojectname$.Filters;
using $safeprojectname$.Models;

namespace $safeprojectname$.Controllers
{
    [Authorize]
    [ValidateHttpAntiForgeryToken]
    public class TodoController : ApiController
    {
        private TodoItemContext db = new TodoItemContext();

        // PUT api/Todo/5
        public HttpResponseMessage PutTodoItem(int id, TodoItemDto todoItemDto)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            if (id != todoItemDto.TodoItemId)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            TodoItem todoItem = todoItemDto.ToEntity();
            TodoList todoList = db.TodoLists.Find(todoItem.TodoListId);
            if (todoList == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            if (todoList.UserId != User.Identity.Name)
            {
                // 사용자에게 속하지 않은 레코드를 수정하려고 시도합니다.
                return Request.CreateResponse(HttpStatusCode.Unauthorized);
            }

            // SaveChanges가 호출될 때 중복 기본 키 예외 발생을 방지하려면 분리해야 합니다.
            db.Entry(todoList).State = EntityState.Detached;
            db.Entry(todoItem).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError);
            }

            return Request.CreateResponse(HttpStatusCode.OK);
        }

        // POST api/Todo
        public HttpResponseMessage PostTodoItem(TodoItemDto todoItemDto)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            TodoList todoList = db.TodoLists.Find(todoItemDto.TodoListId);
            if (todoList == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            if (todoList.UserId != User.Identity.Name)
            {
                // 사용자에게 속하지 않은 레코드를 추가하려고 시도합니다.
                return Request.CreateResponse(HttpStatusCode.Unauthorized);
            }

            TodoItem todoItem = todoItemDto.ToEntity();

            // JSON 직렬화가 이루어질 때 루프 참조 예외 발생을 방지하려면 분리해야 합니다.
            db.Entry(todoList).State = EntityState.Detached;
            db.TodoItems.Add(todoItem);
            db.SaveChanges();
            todoItemDto.TodoItemId = todoItem.TodoItemId;

            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, todoItemDto);
            response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = todoItemDto.TodoItemId }));
            return response;
        }

        // DELETE api/Todo/5
        public HttpResponseMessage DeleteTodoItem(int id)
        {
            TodoItem todoItem = db.TodoItems.Find(id);
            if (todoItem == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            if (db.Entry(todoItem.TodoList).Entity.UserId != User.Identity.Name)
            {
                // 사용자에게 속하지 않은 레코드를 삭제하려고 시도합니다.
                return Request.CreateResponse(HttpStatusCode.Unauthorized);
            }

            TodoItemDto todoItemDto = new TodoItemDto(todoItem);
            db.TodoItems.Remove(todoItem);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError);
            }

            return Request.CreateResponse(HttpStatusCode.OK, todoItemDto);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}