<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<$safeprojectname$.Models.LocalPasswordModel>" %>

<asp:Content ID="manageTitle" ContentPlaceHolderID="TitleContent" runat="server">
    계정 관리
</asp:Content>

<asp:Content ID="manageContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>계정을 관리하십시오.</h1>
    </hgroup>

    <p class="message-success"><%: (string)ViewBag.StatusMessage %></p>

    <p><strong><%: User.Identity.Name %></strong>(으)로 로그인되었습니다.</p>

    <% if (ViewBag.HasLocalPassword) {
        Html.RenderPartial("_ChangePasswordPartial");
    } else {
        Html.RenderPartial("_SetPasswordPartial");
    } %>

    <section id="externalLogins">
        <%: Html.Action("RemoveExternalLogins") %>

        <h3>외부 로그인 추가</h3>
        <%: Html.Action("ExternalLoginsList", new { ReturnUrl = ViewBag.ReturnUrl }) %>
    </section>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>