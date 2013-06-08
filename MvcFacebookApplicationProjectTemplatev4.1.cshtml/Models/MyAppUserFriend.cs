using Microsoft.AspNet.Mvc.Facebook;

// 각 사용자별로 저장하려는 필드를 추가하고 Facebook의 JSON 형식으로 필드 이름을 지정합니다.
// http://go.microsoft.com/fwlink/?LinkId=273889

namespace $safeprojectname$.Models
{
    public class MyAppUserFriend
    {
        public string Name { get; set; }
        public string Link { get; set; }

        [FacebookFieldModifier("height(100).width(100)")] // 그림 높이와 너비를 100픽셀로 설정합니다.
        public FacebookConnection<FacebookPicture> Picture { get; set; }
    }
}
