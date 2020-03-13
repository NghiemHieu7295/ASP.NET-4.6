<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch24CategoryMaint_WCF.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch24: Category Maintenance</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <header class="jumbotron"></header>
        <main>
            <form id="form1" runat="server" class="form-horizontal">
                <div class="col-xs-6">
                    <h1>Edit Categories</h1>
                    <asp:DropDownList ID="ddlCategories" runat="server" DataSourceID="ddlDataSource" DataTextField="LongName" DataValueField="CategoryID" 
                        CssClass="form-control" AutoPostBack="true">
                    </asp:DropDownList>
                    <br />
                    <asp:ObjectDataSource runat="server" ID="ddlDataSource" SelectMethod="GetCategories" 
                        TypeName="Ch24CategoryMaint_WCF.Ch24Service_WCF.CategoryServiceClient">
                    </asp:ObjectDataSource>

                    <asp:DetailsView ID="dvCategory" runat="server" CssClass="table table-bordered table-condensed"
                        AutoGenerateRows="false" DataSourceID="detailsDataSource" DataKeyNames="CategoryID"
                        OnItemDeleted="dvCategory_ItemDeleted" 
                        OnItemInserted="dvCategory_ItemInserted" 
                        OnItemUpdated="dvCategory_ItemUpdated">
                        <Fields>
                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                            <asp:BoundField DataField="LongName" HeaderText="LongName" SortExpression="LongName" />
                            <asp:BoundField DataField="ShortName" HeaderText="ShortName" SortExpression="ShortName" />
                            <asp:CommandField ShowInsertButton="true" ShowEditButton="true" ShowDeleteButton="true" InsertText="Insert" EditText="Edit" DeleteText="Delete"/>
                        </Fields>
                    </asp:DetailsView>

                    <asp:ObjectDataSource runat="server" ID="detailsDataSource" DataObjectTypeName="Ch24CategoryMaint_WCF.Ch24Service_WCF.Category" 
                        DeleteMethod="DeleteCategory" InsertMethod="InsertCategory" SelectMethod="GetCategoryById" 
                        TypeName="Ch24CategoryMaint_WCF.Ch24Service_WCF.CategoryServiceClient" UpdateMethod="UpdateCategory">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCategories" PropertyName="SelectedValue" Name="id" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </form>
        </main>
    </div>
</body>
</html>
