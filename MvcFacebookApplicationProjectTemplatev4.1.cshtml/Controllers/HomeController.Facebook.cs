using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using Microsoft.AspNet.Mvc.Facebook;
using Microsoft.AspNet.Mvc.Facebook.Client;
using $safeprojectname$.Models;

namespace $safeprojectname$.Controllers
{
    public class HomeController : Controller
    {
        [FacebookAuthorize("email", "user_photos")]
        public async Task<ActionResult> Index(FacebookContext context)
        {
            if (ModelState.IsValid)
            {
                var user = await context.Client.GetCurrentUserAsync<MyAppUser>();
                return View(user);
            }

            return View("Error");
        }

        // 이 동작은 다음의 경우에 FacebookAuthorizeFilter로부터의 리디렉션을 처리합니다.
        // 리디렉션이 처리되는 경우는 FacebookAuthorizeAttribute에 지정된 모든 필수 권한이 앱에 없을 때입니다.
        // 이 동작 경로는 Web.config의 appSettings 아래에 'Facebook:AuthorizationRedirectPath' 키로 정의되어 있습니다.
        public ActionResult Permissions(FacebookRedirectContext context)
        {
            if (ModelState.IsValid)
            {
                return View(context);
            }

            return View("Error");
        }
    }
}
