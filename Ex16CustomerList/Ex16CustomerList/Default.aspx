<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sol16CustomerList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch16: Customer List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script></head>
<body>
    <div class="container">
        <header class="jumbotron"><%-- image set in site.css --%></header>
        <main>
            <form id="form1" runat="server">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label Text='<%# Eval("LastName") %>' runat="server" ID="LastNameLabel" /></td>
                            <td>
                                <asp:Label Text='<%# Eval("FirstName") %>' runat="server" ID="FirstNameLabel" /></td>
                            <td>
                                <asp:Label Text='<%# Eval("City") %>' runat="server" ID="CityLabel" /></td>
                            <td>
                                <asp:Label Text='<%# Eval("State") %>' runat="server" ID="StateLabel" /></td>
                            <td>
                                <asp:Label Text='<%# Eval("PhoneNumber") %>' runat="server" ID="PhoneNumberLabel" /></td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" class="col-xs-12 table-responsive">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" class="table table-bordered table-striped">
                                        <thead>
                                            <tr runat="server" style="">
                                                <th runat="server" class="col-xs-3">
                                                    <asp:LinkButton ID="linkButton1" runat="server" CommandName="Sort" CommandArgument="LastName" Text="LastName">
                                                    </asp:LinkButton>
                                                </th>
                                                <th runat="server" class="col-xs-2">FirstName</th>
                                                <th runat="server" class="col-xs-3">
                                                    <asp:LinkButton ID="linkButton2" runat="server" CommandName="Sort" CommandArgument="City" Text="City">
                                                    </asp:LinkButton>
                                                </th>
                                                <th runat="server" class="col-xs-1">
                                                    <asp:LinkButton ID="linkButton3" runat="server" CommandName="Sort" CommandArgument="State" Text="State">
                                                    </asp:LinkButton>
                                                </th>
                                                <th runat="server" class="col-xs-3">PhoneNumber</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr runat="server" id="itemPlaceholder"></tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="" class="text-center">
                                    <asp:DataPager runat="server" ID="ListView1_pager">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" 
                                                ButtonCssClass="btn btn-default">
                                            </asp:NextPreviousPagerField>
                                            <asp:NumericPagerField></asp:NumericPagerField>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" 
                                                ButtonCssClass="btn btn-default">
                                            </asp:NextPreviousPagerField>
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:HalloweenConnectionString %>' 
                    SelectCommand="SELECT [LastName], [FirstName], [City], [State], [PhoneNumber] FROM [Customers] ORDER BY [LastName]"></asp:SqlDataSource>
            </form>
        </main>
    </div>
</body>
</html>
