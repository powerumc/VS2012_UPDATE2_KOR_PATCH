<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    오류 - 내 ASP.NET MVC 응용 프로그램
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1 class="error">오류입니다.</h1>
        <h2 class="error">요청을 처리하는 동안 오류가 발생했습니다.</h2>
    </hgroup>
</asp:Content>
