using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Forms_Exam_29._10._2014.Models;

namespace Web_Forms_Exam_29._10._2014
{
    public partial class Articles : Page
    {
        public NewsSystemDbContext db { get; set; }

        public Articles()
        {
            this.db = new NewsSystemDbContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("Account/Login");
            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Article> ListView1_GetData()
        {
            return db.Articles.AsQueryable();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_UpdateItem(int id)
        {
            Article item = this.db.Articles.Find(id);
            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                this.db.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_DeleteItem(int id)
        {
            var item = this.db.Articles.Find(id);
            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            this.db.Articles.Remove(item);
            this.db.SaveChanges();
        }

        public void ListView1_InsertItem()
        {
            var item = new Article();
            var manager = new UserManager<AppUser>(new UserStore<AppUser>(this.db));
            item.Author = manager.FindById(User.Identity.GetUserId());
            item.DateCreated = DateTime.Now;
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                this.db.Articles.Add(item);
                this.db.SaveChanges();
            }
        }

        public IQueryable<Category> DropDownListCategory_Select()
        {
            return this.db.Categories.AsQueryable();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            
        }
    }
}