using System;
using System.Configuration;
using System.Threading.Tasks;
using Microsoft.AspNet.Mvc.Facebook.Models;
using Microsoft.AspNet.Mvc.Facebook.Realtime;

// Facebook Realtime Updates에 대한 자세한 내용은 http://go.microsoft.com/fwlink/?LinkId=273887을 참조하십시오.

namespace $safeprojectname$.Controllers
{
    public class UserRealtimeUpdateController : FacebookRealtimeUpdateController
    {
        private readonly static string UserVerifyToken = ConfigurationManager.AppSettings["Facebook:VerifyToken:User"];

        public override string VerifyToken
        {
            get
            {
                return UserVerifyToken;
            }
        }

        public override Task HandleUpdateAsync(ChangeNotification notification)
        {
            if (notification.Object == "user")
            {
                foreach (var entry in notification.Entry)
                {
                    // 업데이트를 처리하기 위한 사용자의 논리를 입력함
                }
            }

            throw new NotImplementedException();
        }
    }
}
