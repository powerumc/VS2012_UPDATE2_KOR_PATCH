using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace $safeprojectname$.Models
{
    // 사용자 지정 코드를 이 파일에 추가할 수 있습니다. 변경 사항은 덮어쓰지 않습니다.
    // 
    // Entity Framework에서 모델 스키마를 변경할 때마다 데이터베이스를
    // 자동으로 삭제하고 다시 생성하려면
    // Global.asax 파일에서 Application_Start 메서드에 다음 코드를 추가하십시오.
    // 참고: 이렇게 하면 모델 변경 사항이 있을 때마다 데이터베이스가 삭제되고 다시 만들어집니다.
    // 
    // System.Data.Entity.Database.SetInitializer(new System.Data.Entity.DropCreateDatabaseIfModelChanges<$safeprojectname$.Models.TodoItemContext>());
    public class TodoItemContext : DbContext
    {
        public TodoItemContext()
            : base("name=DefaultConnection")
        {
        }

        public DbSet<TodoItem> TodoItems { get; set; }
        public DbSet<TodoList> TodoLists { get; set; }
    }
}