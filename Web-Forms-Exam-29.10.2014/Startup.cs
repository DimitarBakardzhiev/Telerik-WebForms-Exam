using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Web_Forms_Exam_29._10._2014.Startup))]
namespace Web_Forms_Exam_29._10._2014
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
