using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Forms_Exam_29._10._2014.Models;

namespace Web_Forms_Exam_29._10._2014
{
    public partial class Categories : Page
    {
        public NewsSystemDbContext db { get; set; }

        public Categories()
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

        public void ListView1_UpdateItem(int id)
        {
            Category item = this.db.Categories.Find(id);
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

        public void ListView1_InsertItem()
        {
            var item = new Category();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                this.db.Categories.Add(item);
                this.db.SaveChanges();
            }
        }

        public void ListView1_DeleteItem(int id)
        {
            var item = this.db.Categories.Find(id);
            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            this.db.Categories.Remove(item);
            this.db.SaveChanges();
        }

        public IQueryable<Category> ListView1_GetData()
        {
            return this.db.Categories.AsQueryable();
        }
    }
}