using NewsSite.Migrations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Forms_Exam_29._10._2014.Models;

namespace Web_Forms_Exam_29._10._2014
{
    public partial class Home : Page
    {
        NewsSystemDbContext db;

        public Home()
        {
            this.db = new NewsSystemDbContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            bool DataBaseIsEmpty = this.db.Articles.AsQueryable().Count() == 0 && this.db.Categories.AsQueryable().Count() == 0;
            if (DataBaseIsEmpty)
            {
                FillDatabase();
            }
        }

        private void FillDatabase()
        {
            var dataSeed = new SeedData();
            foreach (var article in dataSeed.Articles)
            {
                db.Articles.Add(article);
            }

            foreach (var category in dataSeed.Categories)
            {
                db.Categories.Add(category);
            }

            db.SaveChanges();
        }

        public IQueryable<Article> RepeaterPopularArticles_GetData()
        {
            return db.Articles.OrderByDescending(a => a.Likes)
                                .Take(3)
                                .AsQueryable();
        }

        public IQueryable<Category> ListViewCategories_GetData()
        {
            return db.Categories.OrderBy(c => c.Name)
                                .AsQueryable();
        }
    }
}