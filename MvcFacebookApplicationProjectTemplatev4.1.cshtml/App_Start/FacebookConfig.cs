using System;
using System.Web.Mvc;
using Microsoft.AspNet.Mvc.Facebook;
using Microsoft.AspNet.Mvc.Facebook.Authorization;

namespace $safeprojectname$
{
    public static class FacebookConfig
    {
        public static void Register(FacebookConfiguration configuration)
        {
            // 다음 응용 프로그램 설정 키를 사용하여 web.config의 설정을 로드합니다.
            // Facebook:AppId, Facebook:AppSecret, Facebook:AppNamespace
            configuration.LoadFromAppSettings();

            // Facebook에서 서명한 요청 및 권한을 확인하기 위해 권한 부여 필터 추가
            GlobalFilters.Filters.Add(new FacebookAuthorizeFilter(configuration));
        }
    }
}
