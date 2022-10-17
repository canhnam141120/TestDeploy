using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace DemoDeploy.Entities
{
    public class ToDo
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [MaxLength(30)]
        public string Name { get; set; }
        public string? Description { get; set; }

        [Range(1, 3)]
        public int Priority { get; set; }
        public bool IsCompleted { get; set; }
    }
}
