<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch13ProductList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch13: Invoice Line Items</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main>
        <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group">
                <label id="lblInvoice" for="ddlInvoice" 
                    class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
                    Choose an invoice:</label>
                <div class="col-xs-8 col-sm-5">
                    <asp:DropDownList ID="ddlInvoice" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="InvoiceNumber" DataValueField="InvoiceNumber" AutoPostBack="true" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString='<%$ ConnectionStrings:HalloweenConnectionString %>' 
                        SelectCommand="SELECT [InvoiceNumber] FROM [Invoices] WHERE ([Total] > @Total)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="300" Name="Total" Type="Decimal"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-9">
                    <asp:DataList ID="dlLineItems" runat="server" DataSourceID="SqlDataSource2" 
                        CssClass="table table-bordered table-striped table-condensed">
                        <HeaderTemplate>
                            <span class="col-xs-3">Product</span>
                            <span class="col-xs-3 text-right">Unit Price</span>
                            <span class="col-xs-3 text-right">Quantity</span>
                            <span class="col-xs-3 text-right">Extension</span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" CssClass="col-xs-3" />
                            <asp:Label Text='<%# Eval("UnitPrice", "{0:C}") %>' runat="server" ID="UnitPriceLabel" CssClass="col-xs-3 text-right" />
                            <asp:Label Text='<%# Eval("Quantity") %>' runat="server" ID="QuantityLabel" CssClass="col-xs-3 text-right" />
                            <asp:Label Text='<%# Eval("Extension", "{0:C}") %>' runat="server" ID="ExtensionLabel" CssClass="col-xs-3 text-right" />
                        </ItemTemplate>
                        <HeaderStyle CssClass="bg-halloween"/>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString='<%$ ConnectionStrings:HalloweenConnectionString %>' 
                        SelectCommand="SELECT [ProductID], [UnitPrice], [Quantity], [Extension] FROM [LineItems] WHERE ([InvoiceNumber] = @InvoiceNumber)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlInvoice" PropertyName="SelectedValue" Name="InvoiceNumber" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>  
            </div>
        </form>
    </main>
</div>
</body>
</html>