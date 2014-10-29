<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Web_Forms_Exam_29._10._2014.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>News</h1>
    <h2>Most popular articles</h2>
    <asp:Repeater runat="server" ID="RepeaterPopularArticles" ItemType="Web_Forms_Exam_29._10._2014.Models.Article" 
        SelectMethod="RepeaterPopularArticles_GetData">
        <ItemTemplate>
            <div class="row">
                <h3><a href="Details?id=<%# Item.Id %>"><%# Item.Title %></a> <small><%# Item.Category.Name %></small></h3>
                
                <article><%#: Item.Content %></article>
                <article>Likes: <%# Item.Likes %></article>
                <div style="font-style:italic;">
                    by <%# Item.Author.UserName %> created on: <%# Item.DateCreated %>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <h2>All categories</h2>
    <asp:ListView runat="server" ID="ListViewCategories" ItemType="Web_Forms_Exam_29._10._2014.Models.Category" 
        SelectMethod="ListViewCategories_GetData"
        GroupItemCount="2">
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
            </div>
        </GroupTemplate>

        <ItemTemplate>
            <div class="col-md-6">
                <h3><%#: Item.Name %></h3>
                <asp:ListView runat="server" ID="RepeaterArticles" ItemType="Web_Forms_Exam_29._10._2014.Models.Article" 
                    DataSource="<%# Item.Articles %>">
                    <LayoutTemplate>
                        <ul>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <a href="Details?id=<%# Item.Id %>"><strong><%# Item.Title %></strong> <i> by <%# Item.Author.UserName %></i></a>
                        </li>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        No articles.
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
