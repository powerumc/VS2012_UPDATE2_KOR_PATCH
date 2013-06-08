<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<$safeprojectname$.Models.RegisterExternalLoginModel>" %>

<asp:Content ID="externalLoginConfirmationTitle" ContentPlaceHolderID="TitleContent" runat="server">
    등록
</asp:Content>

<asp:Content ID="externalLoginConfirmationContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>등록하십시오.</h1>
        <h2><%: ViewBag.ProviderDisplayName %> 계정을 연결하십시오.</h2>
    </hgroup>

    <% using (Html.BeginForm("ExternalLoginConfirmation", "Account", new { ReturnUrl = ViewBag.ReturnUrl })) { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>연결 양식</legend>
            <p>
                <strong><%: ViewBag.ProviderDisplayName %></strong>(으)로 인증되었습니다.
                이 사이트에 대한 사용자 이름을 아래에 입력하고 확인 단추를 클릭하여 로그인을
                완료하십시오.
            </p>
            <ol>
                <li class="name">
                    <%: Html.LabelFor(m => m.UserName) %>
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </li>
            </ol>
            <%: Html.HiddenFor(m => m.ExternalLoginData) %>
            <input type="submit" value="등록" />
        </fieldset>
    <% } %>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
