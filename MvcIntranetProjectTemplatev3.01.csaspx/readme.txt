인트라넷 템플릿을 사용하려면 Windows 인증을 사용하도록 설정하고
익명 인증을 사용하지 않도록 설정해야 합니다.

IIS 6.0에 대한 내용을 포함한 자세한 내용을 보려면 다음 사이트를 방문하십시오.
http://go.microsoft.com/fwlink/?LinkID=213745

IIS 7
1. IIS 관리자를 열고 웹 사이트로 이동합니다.
2. 기능 보기에서 인증을 두 번 클릭합니다.
3. 인증 페이지에서 Windows 인증을 선택합니다. Windows 인증이
   옵션이 아닌 경우 Windows 인증이 서버에 설치되어 있는지
   확인해야 합니다.
        Windows 인증을 사용하려면
 a) 제어판에서 "프로그램 및 기능"을 엽니다.
 b) "Windows 기능 사용/사용 안 함"을 선택합니다.
 c) 인터넷 정보 서비스 | World Wide Web 서비스 | 보안으로 이동한 다음
    Windows 인증 노드가 선택되어 있는지 확인합니다.
4. Windows 인증을 사용하려면 작업 창에서 사용을 클릭합니다.
5. 인증 페이지에서 익명 인증을 선택합니다.
6. 익명 인증을 사용하지 않도록 설정하려면 작업 창에서 사용 안 함을 클릭합니다.

IIS Express
1. Visual Studio에서 프로젝트를 마우스 오른쪽 단추로 클릭한 다음 IIS Express 사용을
   선택합니다.
2. 솔루션 탐색기에서 프로젝트를 클릭하여 해당 프로젝트를 선택합니다.
3. 속성 창이 열려 있지 않은 경우 F4 키를 사용하여 엽니다.
4. 프로젝트에 대한 속성 창에서
 a) "익명 인증"을 "사용 안 함"으로 설정합니다.
 b) "Windows 인증"을 "사용"으로 설정합니다.

Microsoft Web Platform Installer를 사용하여 IIS Express를 설치할 수 있습니다.
    Visual Studio의 경우: http://go.microsoft.com/fwlink/?LinkID=214802
    Visual Web Developer의 경우: http://go.microsoft.com/fwlink/?LinkID=214800
