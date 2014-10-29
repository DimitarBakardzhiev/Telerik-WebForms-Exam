<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="Web_Forms_Exam_29._10._2014.Articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView runat="server" ID="ListViewArticles" DataKeyNames="Id" InsertItemPosition="LastItem" 
        ItemType="Web_Forms_Exam_29._10._2014.Models.Article" SelectMethod="ListView1_GetData" UpdateMethod="ListView1_UpdateItem"
        DeleteMethod="ListView1_DeleteItem" InsertMethod="ListView1_InsertItem">
        <AlternatingItemTemplate>
            <span style="">
            <h3><asp:Label ID="TitleLabel" runat="server" Text='<%#: Item.Title %>' /></h3>
            <br />
            <asp:Label ID="ContentLabel" runat="server" Text='<%#: Item.Content %>' />
            <br />
            <br />
            Category:
            <asp:Label ID="CategoryIdLabel" runat="server" Text='<%#: Item.Category.Name %>' />
            <br />
            Author:
            <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Item.Author.UserName %>' />
            <br />
            <i>Date Created:
            <asp:Label ID="DateCreatedLabel" runat="server" Text='<%# Item.DateCreated %>' /></i>
            <br />
            Likes:
            <asp:Label ID="LikesLabel" runat="server" Text='<%# Item.Likes %>' />
            <br />
            <asp:Button CssClass="btn btn-info" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">
            <h3><asp:TextBox ID="TitleTextBox" runat="server" Text='<%# BindItem.Title %>' /></h3>
            <br />
            <asp:TextBox ID="ContentTextBox" runat="server" Text='<%#: BindItem.Content %>' />
            <br />
            <br />
            Category:
            <asp:DropDownList runat="server" ID="DropDownListCategory" ItemType="Web_Forms_Exam_29._10._2014.Models.Category"
                SelectMethod="DropDownListCategory_Select" DataTextField="Name" DataValueField="Id" 
                SelectedValue="<%# BindItem.CategoryId %>"></asp:DropDownList>
            <br />
            Author:
            <asp:TextBox ID="AuthorIdTextBox" runat="server" Text='<%# BindItem.Author.UserName %>' />
            <br />
            <i>Date Created:
            <asp:TextBox ID="DateCreatedTextBox" runat="server" Text='<%# BindItem.DateCreated %>' /></i>
            <br />
            Likes:
            <asp:TextBox ID="LikesTextBox" runat="server" Text='<%# BindItem.Likes %>' />
            <br />
            <asp:Button CssClass="btn btn-info" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button CssClass="btn btn-danger" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# BindItem.Title %>' />
            <br />
            Content:
            <asp:TextBox ID="ContentTextBox" runat="server" Text='<%#: BindItem.Content %>' />
            <br />
            Category:
            <asp:DropDownList runat="server" ID="DropDownListCategory" ItemType="Web_Forms_Exam_29._10._2014.Models.Category"
                SelectMethod="DropDownListCategory_Select" DataTextField="Name" DataValueField="Id" 
                SelectedValue="<%# BindItem.CategoryId %>"></asp:DropDownList>
            <br />
            <asp:Button CssClass="btn btn-info" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button CssClass="btn btn-danger" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate><span style="">
            <h3><asp:Label ID="TitleLabel" runat="server" Text='<%#: Item.Title %>' /></h3>
            <br />
            <asp:Label ID="ContentLabel" runat="server" Text='<%#: Item.Content %>' />
            <br />
            <br />
            Category:
            <asp:Label ID="CategoryIdLabel" runat="server" Text='<%#: Item.Category.Name %>' />
            <br />
            Author:
            <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Item.Author.UserName %>' />
            <br />
            <i>Date Created:
            <asp:Label ID="DateCreatedLabel" runat="server" Text='<%# Item.DateCreated %>' /></i>
            <br />
            Likes:
            <asp:Label ID="LikesLabel" runat="server" Text='<%# Item.Likes %>' />
            <br />
            <asp:Button CssClass="btn btn-info" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span></ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <asp:LinkButton Text="Sort by Title" ID="btnSortByTitle" CssClass="btn btn-default" runat="server"
                    CommandName="Sort" CommandArgument="Title" />
                <asp:LinkButton Text="Sort by Date" ID="btnSortByDate" CssClass="btn btn-default" runat="server"
                    CommandName="Sort" CommandArgument="DateCreated" />
                <asp:LinkButton Text="Sort by Category" ID="btnSortByCategory" CssClass="btn btn-default" runat="server"
                    CommandName="Sort" CommandArgument="CategoryId" />
                <asp:LinkButton Text="Sort by Likes" ID="btnSortByLikes" CssClass="btn btn-default" runat="server"
                    CommandName="Sort" CommandArgument="Likes" />
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
                <asp:DataPager PageSize="5" ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">
            <h3><asp:Label ID="TitleLabel" runat="server" Text='<%#: Item.Title %>' /></h3>
            <br />
            <asp:Label ID="ContentLabel" runat="server" Text='<%#: Item.Content %>' />
            <br />
            <br />
            Category:
            <asp:Label ID="CategoryIdLabel" runat="server" Text='<%#: Item.Category.Name %>' />
            <br />
            Author:
            <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Item.Author.UserName %>' />
            <br />
            <i>Date Created:
            <asp:Label ID="DateCreatedLabel" runat="server" Text='<%# Item.DateCreated %>' /></i>
            <br />
            Likes:
            <asp:Label ID="LikesLabel" runat="server" Text='<%# Item.Likes %>' />
            <br />
            <asp:Button CssClass="btn btn-info" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
