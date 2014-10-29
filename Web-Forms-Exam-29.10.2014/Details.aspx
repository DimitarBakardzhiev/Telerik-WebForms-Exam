<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Web_Forms_Exam_29._10._2014.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView runat="server" ID="ListViewArticleDetails" ItemType="Web_Forms_Exam_29._10._2014.Models.Article"
        SelectMethod="ListViewArticleDetails_GetData" DataKeyNames="Id">
        <ItemTemplate>
            <h2><%# Item.Title %> <small>Category: <%# Item.Category.Name %></small></h2>
            <article><%# Item.Content %></article>
            <article>
                <span>Author: <%# Item.Author.UserName %></span>
                <span class="pull-right"><%# Item.DateCreated %></span>
            </article>
            <div>
                <asp:Button ID="btnLike" Text="+" runat="server" OnClick="btnLike_Click" />
                <asp:Label runat="server" ID="LabelLikes">Likes: <%# Item.Likes %></asp:Label>
                <asp:Button ID="btnDislike" Text="-" runat="server" OnClick="btnDislike_Click" />
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
