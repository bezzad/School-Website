using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Xalag.Startup))]
namespace Xalag
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
