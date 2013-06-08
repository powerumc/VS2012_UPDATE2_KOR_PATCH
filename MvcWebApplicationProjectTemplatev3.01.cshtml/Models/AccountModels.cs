using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;

namespace $safeprojectname$.Models {

    public class ChangePasswordModel {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "현재 암호")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "{0}은(는) {2}자 이상이어야 합니다.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "새 암호")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "새 암호 확인")]
        [System.Web.Mvc.Compare("NewPassword", ErrorMessage = "새 암호와 확인 암호가 일치하지 않습니다.")]
        public string ConfirmPassword { get; set; }
    }

    public class LogOnModel {
        [Required]
        [Display(Name = "사용자 이름")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "암호")]
        public string Password { get; set; }

        [Display(Name = "사용자 이름 및 암호 저장")]
        public bool RememberMe { get; set; }
    }

    public class RegisterModel {
        [Required]
        [Display(Name = "사용자 이름")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "전자 메일 주소")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "{0}은(는) {2}자 이상이어야 합니다.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "암호")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "암호 확인")]
        [System.Web.Mvc.Compare("Password", ErrorMessage = "암호와 확인 암호가 일치하지 않습니다.")]
        public string ConfirmPassword { get; set; }
    }
}
