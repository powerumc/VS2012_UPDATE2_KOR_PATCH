<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    정보 - 내 ASP.NET MVC 응용 프로그램
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>정보입니다.</h1>
        <h2><%: ViewBag.Message %></h2>
    </hgroup>

    <article>
        <p>
            이 영역에 추가 정보를 입력하십시오.
        </p>

        <p>
            이 영역에 추가 정보를 입력하십시오.
        </p>

        <p>
            이 영역에 추가 정보를 입력하십시오.
        </p>
    </article>

    <aside>
        <h3>제목란</h3>
        <p>
            이 영역에 추가 정보를 입력하십시오.
        </p>
        <ul>
            <li><%: Html.ActionLink("홈", "Index", "Home") %></li>
            <li><%: Html.ActionLink("정보", "About", "Home") %></li>
            <li><%: Html.ActionLink("연락처", "Contact", "Home") %></li>
        </ul>
    </aside>
</asp:Content>