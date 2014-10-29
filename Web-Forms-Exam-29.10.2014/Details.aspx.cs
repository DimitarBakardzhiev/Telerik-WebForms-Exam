using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Forms_Exam_29._10._2014.Models;

namespace Web_Forms_Exam_29._10._2014
{
    public partial class Details : System.Web.UI.Page
    {
        public NewsSystemDbContext db { get; set; }

        public Details()
        {
            this.db = new NewsSystemDbContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Article> ListViewArticleDetails_GetData([QueryString("id")] string query)
        {
            int id = int.Parse(query);
            return db.Articles.Where(a => a.Id == id).AsQueryable();
        }

        protected void btnLike_Click(object sender, EventArgs e)
        {
            var id = int.Parse(Request.QueryString["id"]);
            var article = db.Articles.FirstOrDefault(a => a.Id == id);
            article.Likes += 1;
            db.SaveChanges();
        }

        protected void btnDislike_Click(object sender, EventArgs e)
        {
            var id = int.Parse(Request.QueryString["id"]);
            var article = db.Articles.FirstOrDefault(a => a.Id == id);
            article.Likes -= 1;
            db.SaveChanges();
        }
    }
}