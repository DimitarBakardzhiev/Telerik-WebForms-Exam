using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;

namespace Web_Forms_Exam_29._10._2014.Models
{
    public class Category
    {
        public Category()
        {
            this.Articles = new HashSet<Article>();
        }

        [Key]
        public int Id { get; set; }

        [Required]
        // [Index(IsUnique=true)]
        public string Name { get; set; }

        public virtual ICollection<Article> Articles { get; set; }
    }
}