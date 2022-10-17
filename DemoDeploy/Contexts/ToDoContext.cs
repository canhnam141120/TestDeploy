using DemoDeploy.Entities;
using Microsoft.EntityFrameworkCore;

namespace DemoDeploy.Contexts
{

    public class ToDoContext : DbContext
    {
        public ToDoContext(DbContextOptions<ToDoContext> options) : base(options)
        {
        }

        public DbSet<ToDo> ToDos { get; set; }
    }
}
