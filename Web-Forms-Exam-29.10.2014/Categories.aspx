<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="Web_Forms_Exam_29._10._2014.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView runat="server" ID="ListViewCategories" DataKeyNames="Id" ItemType="Web_Forms_Exam_29._10._2014.Models.Category" 
        InsertItemPosition="LastItem" UpdateMethod="ListView1_UpdateItem" InsertMethod="ListView1_InsertItem" 
        DeleteMethod="ListView1_DeleteItem" SelectMethod="ListView1_GetData">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%#: Item.Name %>' />
                </td>
                <td>         
                    <asp:Button CssClass="btn btn-info" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# BindItem.Name %>' />
                </td>
                <td>
                    <asp:Button CssClass="btn btn-info" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button CssClass="btn btn-danger" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# BindItem.Name %>' />
                </td>
                <td>
                    <asp:Button CssClass="btn btn-info" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button CssClass="btn btn-danger" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%#: Item.Name %>' />
                </td>
                <td>              
                    <asp:Button CssClass="btn btn-info" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">
                                    <asp:LinkButton Text="Category Name" runat="server" ID="ButtonSortByName" CssClass="btn btn-default" CommandName="Sort" CommandArgument="Name"/></asp:linkbutton></th>
                                <th runat="server"></th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%#: Item.Name %>' />
                </td>
                <td>
                    <asp:Button CssClass="btn btn-info" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
