<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<$safeprojectname$.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    등록
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        암호는 (<%: Membership.MinRequiredPasswordLength %>)자 이상이어야 합니다.
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
                <%: Html.LabelFor(m => m.Email) %>
                <%: Html.TextBoxFor(m => m.Email) %>                
            </li>

            <li data-role="fieldcontain">
                <%: Html.LabelFor(m => m.Password) %>
                <%: Html.PasswordFor(m => m.Password) %>                
            </li>

            <li data-role="fieldcontain">
                <%: Html.LabelFor(m => m.ConfirmPassword) %>
                <%: Html.PasswordFor(m => m.ConfirmPassword) %>                
            </li>

            <li data-role="fieldcontain">
                <input type="submit" value="등록" />
            </li>
        </ul>
    <% } %>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
