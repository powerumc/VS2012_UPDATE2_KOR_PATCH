<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        환영합니다, <strong><%: Page.User.Identity.Name %></strong> 님!
        [ <%: Html.ActionLink("로그오프", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("로그온", "LogOn", "Account") %> ]
<%
    }
%>
