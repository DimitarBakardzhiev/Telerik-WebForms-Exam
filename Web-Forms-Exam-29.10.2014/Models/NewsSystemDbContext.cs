using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using Web_Forms_Exam_29._10._2014.Migrations;

namespace Web_Forms_Exam_29._10._2014.Models
{
    public class NewsSystemDbContext : IdentityDbContext<AppUser>
    {
        public NewsSystemDbContext()
            : base("NewsSystemDb", throwIfV1Schema: false)
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<NewsSystemDbContext, Configuration>());
        }

        public IDbSet<Article> Articles { get; set; }

        public IDbSet<Category> Categories { get; set; }

        public static NewsSystemDbContext Create()
        {
            return new NewsSystemDbContext();
        }
    }
}