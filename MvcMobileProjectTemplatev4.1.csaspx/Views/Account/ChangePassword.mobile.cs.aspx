<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<$safeprojectname$.Models.ChangePasswordModel>" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    암호 변경
</asp:Content>

<asp:Content ID="changePasswordHeader" ContentPlaceHolderID="Header" runat="server">
    <%: Html.ActionLink("취소", "Index", "Home", null, new { data_icon = "arrow-l", data_rel = "back" }) %>
    <h1>암호 변경</h1>
</asp:Content>

<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        암호는 <%: Membership.MinRequiredPasswordLength %>자 이상이어야 합니다.
    </p>

    <% using (Html.BeginForm()) { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary() %>

        <ul data-role="listview" data-inset="true">
            <li data-role="list-divider">계정 정보</li>

            <li data-role="fieldcontain">
                <%: Html.LabelFor(m => m.OldPassword) %>
                <%: Html.PasswordFor(m => m.OldPassword) %>                
            </li>

            <li data-role="fieldcontain">
                <%: Html.LabelFor(m => m.NewPassword) %>
                <%: Html.PasswordFor(m => m.NewPassword) %>                
            </li>

            <li data-role="fieldcontain">
                <%: Html.LabelFor(m => m.ConfirmPassword) %>
                <%: Html.PasswordFor(m => m.ConfirmPassword) %>                
            </li>

            <li data-role="fieldcontain">
                <input type="submit" value="암호 변경" />
            </li>
        </ul>
    <% } %>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
