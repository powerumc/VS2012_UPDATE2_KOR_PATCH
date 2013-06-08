<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<$safeprojectname$.Models.LoginModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    로그인
</asp:Content>

<asp:Content ID="loginHeader" ContentPlaceHolderID="Header" runat="server">
    <%: Html.ActionLink("취소", "Index", "Home", null, new { data_icon = "arrow-l", data_rel = "back" }) %>
    <h1>로그인</h1>
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        사용자 이름과 암호를 입력하십시오. <%: Html.ActionLink("등록", "Register") %> 등록하십시오.
    </p>

    <% using (Html.BeginForm()) { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary() %>

        <ul data-role="listview" data-inset="true">
            <li data-role="list-divider">자세히</li>

            <li data-role="fieldcontain">
                <%: Html.LabelFor(m => m.UserName) %>
                <%: Html.TextBoxFor(m => m.UserName) %>                
            </li>

            <li data-role="fieldcontain">
                <%: Html.LabelFor(m => m.Password) %>
                <%: Html.PasswordFor(m => m.Password) %>                
            </li>

            <li data-role="fieldcontain">
                <%: Html.LabelFor(m => m.RememberMe) %>
                <%: Html.CheckBoxFor(m => m.RememberMe) %>
            </li>

            <li data-role="fieldcontain">
                <input type="submit" value="로그인" />
            </li>
        </ul>
    <% } %>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
