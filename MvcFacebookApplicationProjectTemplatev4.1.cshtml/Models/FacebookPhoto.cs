using Newtonsoft.Json;

namespace $safeprojectname$.Models
{
    public class FacebookPhoto
    {
        [JsonProperty("picture")] // 속성 이름을 그림으로 바꿉니다.
        public string ThumbnailUrl { get; set; }

        public string Link { get; set; }
    }
}
