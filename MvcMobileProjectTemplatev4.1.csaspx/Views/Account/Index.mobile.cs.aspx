<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<$safeprojectname$.Models.LoginModel>" %>

<asp:Content runat="server" ID="indexTitle" ContentPlaceHolderID="TitleContent">
    사용자 계정
</asp:Content>

<asp:Content runat="server" ID="indexHeader" ContentPlaceHolderID="Header">
    <%: Html.ActionLink("뒤로", "Index", "Home", null, new { data_icon = "arrow-l", data_rel = "back" }) %>
    <h1>사용자 계정</h1>
</asp:Content>

<asp:Content runat="server" ID="indexContent" ContentPlaceHolderID="MainContent">
    <p>
        <strong><%: Page.User.Identity.Name %></strong>(으)로 로그인되었습니다.
    </p>

    <ul data-role="listview" data-inset="true">
        <li><%: Html.ActionLink("암호 변경", "ChangePassword") %></li>
        <li><%: Html.ActionLink("로그오프", "LogOff") %></li>
    </ul>
</asp:Content>