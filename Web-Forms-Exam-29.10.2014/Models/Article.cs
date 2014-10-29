using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Web_Forms_Exam_29._10._2014.Models
{
    public class Article
    {
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Content { get; set; }

        [Required]
        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }

        // [Required]
        public string AuthorId { get; set; }

        public virtual AppUser Author { get; set; }

        [Required]
        public int Likes { get; set; }

        public DateTime DateCreated { get; set; }
    }
}