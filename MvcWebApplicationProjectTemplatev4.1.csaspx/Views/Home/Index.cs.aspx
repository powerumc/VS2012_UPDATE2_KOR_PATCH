﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    홈 페이지 - 내 ASP.NET MVC 응용 프로그램
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>홈 페이지입니다.</h1>
                <h2><%: ViewBag.Message %></h2>
            </hgroup>
            <p>
                To learn more about ASP.NET MVC visit
                <a href="http://asp.net/mvc" title="ASP.NET MVC Website">http://asp.net/mvc</a>.
                The page features <mark>동영상, 자습서 및 샘플</mark> ASP.NET MVC를 최대한 활용할 수 있는 방법이 나와 있습니다.
                ASP.NET MVC와 관련하여 궁금한 사항이 있으면
                <a href="http://forums.asp.net/1146.aspx/1?MVC" title="ASP.NET MVC 포럼">ASP.NET MVC 포럼</a>을 참조하십시오.
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>권장 사항:</h3>
    <ol class="round">
        <li class="one">
            <h5>시작</h5>
            ASP.NET MVC는 정확한 관심사 분리를 가능하게 하고, 즐길 수 있는 민첩 개발을 위한 마크업에 대한
            완전한 제어 기능을 제공하는 동적 웹 사이트를 빌드할 수 있는 강력한, 패턴 기반의
            방법을 제공합니다. ASP.NET MVC에는
            최신 웹 표준을 사용하는 정교한 응용 프로그램을 만들기 위한 빠른,
            TDD가 용이한 개발을 가능하게 하는 여러 기능이 포함되어 있습니다.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245151">자세한 정보…</a>
        </li>

        <li class="two">
            <h5>NuGet 패키지를 추가하고 코드 바로 시작</h5>
            NuGet을 사용하면 무료 라이브러리 및 도구를 쉽게 설치하고 업데이트할 수 있습니다.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245153">자세한 정보…</a>
        </li>

        <li class="three">
            <h5>웹 호스팅 찾기</h5>
            사용자 응용 프로그램에 적합한 기능을 제공하면서 가격이 합리적인 웹 호스팅 회사를
            쉽게 찾을 수 있습니다.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245157">자세한 정보…</a>
        </li>
    </ol>
</asp:Content>
