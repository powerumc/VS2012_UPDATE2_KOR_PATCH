<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="externalLoginFailureTitle" ContentPlaceHolderID="TitleContent" runat="server">
    로그인 실패
</asp:Content>

<asp:Content ID="externalLoginFailureContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>로그인에 실패했습니다.</h1>
        <h2>서비스에 로그인하지 못했습니다.</h2>
    </hgroup>
</asp:Content>
