<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="contactTitle" ContentPlaceHolderID="TitleContent" runat="server">
    연락처 - 내 ASP.NET MVC 응용 프로그램
</asp:Content>

<asp:Content ID="contactContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>연락처입니다.</h1>
        <h2><%: ViewBag.Message %></h2>
    </hgroup>
    <section class="contact">
        <header>
            <h3>전화:</h3>
        </header>
        <p>
            <span class="label">대표:</span>
            <span>425.555.0100</span>
        </p>
        <p>
            <span class="label">근무 시간 이후:</span>
            <span>425.555.0199</span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>전자 메일:</h3>
        </header>
        <p>
            <span class="label">지원:</span>
            <span><a href="mailto:Support@example.com">Support@example.com</a></span>
        </p>
        <p>
            <span class="label">마케팅:</span>
            <span><a href="mailto:Marketing@example.com">Marketing@example.com</a></span>
        </p>
        <p>
            <span class="label">일반:</span>
            <span><a href="mailto:General@example.com">General@example.com</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>주소:</h3>
        </header>
        <p>
            One Microsoft Way<br />
            Redmond, WA 98052-6399
        </p>
    </section>
</asp:Content>