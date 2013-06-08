﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ICollection<$safeprojectname$.Models.ExternalLogin>>" %>

<% if (Model.Count > 0) { %>
    <h3>등록된 외부 로그인</h3>
    <table>
        <tbody>
        <% foreach ($safeprojectname$.Models.ExternalLogin externalLogin in Model) { %>
            <tr>
                <td><%: externalLogin.ProviderDisplayName %></td>
                <td>
                    <% if (ViewBag.ShowRemoveButton) {
                        using (Html.BeginForm("Disassociate", "Account")) { %>
                            <%: Html.AntiForgeryToken() %>
                            <div>
                                <%: Html.Hidden("provider", externalLogin.Provider) %>
                                <%: Html.Hidden("providerUserId", externalLogin.ProviderUserId) %>
                                <input type="submit" value="제거" title="계정에서 <%: externalLogin.ProviderDisplayName %> 이 자격 증명 제거" />
                            </div>
                        <% }
                    } else { %>
                        &nbsp;
                    <% } %>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
<% } %>
