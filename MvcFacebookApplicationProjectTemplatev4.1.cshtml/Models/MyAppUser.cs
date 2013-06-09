using Microsoft.AspNet.Mvc.Facebook;
using Newtonsoft.Json;

// 각 사용자별로 저장하려는 필드를 추가하고 Facebook의 JSON 형식으로 필드 이름을 지정합니다.
// http://go.microsoft.com/fwlink/?LinkId=273889

namespace $safeprojectname$.Models
{
    public class MyAppUser
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }

        [JsonProperty("picture")] // 속성의 이름을 그림으로 바꿉니다.
        [FacebookFieldModifier("type(large)")] // 그림 크기를 대형으로 설정합니다.
        public FacebookConnection<FacebookPicture> ProfilePicture { get; set; }

        [FacebookFieldModifier("limit(8)")] // 친구 목록의 크기를 8로 설정합니다(이를 제거하면 모든 친구가 나열됨).
        public FacebookGroupConnection<MyAppUserFriend> Friends { get; set; }

        [FacebookFieldModifier("limit(16)")] // 사진 목록의 크기를 16으로 설정합니다(이를 제거하면 모든 사진이 나열됨).
        public FacebookGroupConnection<FacebookPhoto> Photos { get; set; }
    }
}
