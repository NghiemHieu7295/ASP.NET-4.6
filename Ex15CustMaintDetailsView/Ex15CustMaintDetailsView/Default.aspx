<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch15ProductMaintenance.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch15: Product Maintenance</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main class="row">
        <form id="form1" runat="server">

            <div class="col-sm-5 table-responsive">
                <asp:GridView ID="grdCustomers" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="Email" 
                    DataSourceID="SqlDataSource1" AllowPaging="True" 
                    SelectedIndex="0" UseAccessibleHeader="True" 
                    CssClass="table table-bordered table-striped table-condensed" 
                    OnPreRender="grdCustomers_PreRender">
                    <Columns>
                        <asp:BoundField DataField="Email" HeaderText="Email" 
                            ReadOnly="True" Visible="false">
                        </asp:BoundField>
                        <asp:BoundField DataField="LastName" HeaderText="Last Name">
                            <ItemStyle CssClass="col-xs-5" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FirstName" HeaderText="First Name"> 
                            <ItemStyle CssClass="col-xs-5" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Link" ShowSelectButton="true">
                            <ItemStyle  CssClass="col-xs-1"/>
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <PagerSettings Mode="NextPreviousFirstLast" />
                    <PagerStyle CssClass="pagerStyle" 
                        BackColor="#8c8c8c" HorizontalAlign="Center" />
                    <SelectedRowStyle CssClass="warning" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
                    SelectCommand="SELECT [Email], [LastName], [FirstName] 
                        FROM [Customers] ORDER BY [LastName]">
                </asp:SqlDataSource>    
            </div>  

            <div class="col-sm-7">
                <asp:DetailsView ID="dvCustomer" runat="server" CssClass="table table-bordered table-condensed" 
                    DataSourceID="SqlDataSource2" DataKeyNames="Email" AutoGenerateRows="false" OnItemDeleted="dvCustomer_ItemDeleted" OnItemDeleting="dvCustomer_ItemDeleting" OnItemInserted="dvCustomer_ItemInserted" OnItemUpdated="dvCustomer_ItemUpdated">
                    <Fields>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblEmail" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label runat="server" ID="lblEmail" Text='<%# Bind("Email") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtEmail" MaxLength="25" CssClass="form-control" 
                                        Text='<%# Bind("Email") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvEmail" ControlToValidate="txtEmail" CssClass="text-danger" 
                                    ErrorMessage="Email is required field">*
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblLastName" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtLastName" MaxLength="20" CssClass="form-control" 
                                        Text='<%# Bind("LastName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvLastName" ControlToValidate="txtLastName" CssClass="text-danger" 
                                    ErrorMessage="Last Name is required field.">*
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtLastName" MaxLength="20" CssClass="form-control" 
                                        Text='<%# Bind("LastName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvLastName" ControlToValidate="txtLastName" CssClass="text-danger" 
                                    ErrorMessage="Last Name is required field.">*
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblFirstName" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtFirstName" MaxLength="20" CssClass="form-control" 
                                        Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvFirstName" ControlToValidate="txtFirstName" CssClass="text-danger" 
                                    ErrorMessage="First Name is required field.">*
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtFirstName" MaxLength="20" CssClass="form-control" 
                                        Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvFirstName" ControlToValidate="txtFirstName" CssClass="text-danger" 
                                    ErrorMessage="First Name is required field.">*
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblAddress" Text='<%# Bind("Address") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtAddress" MaxLength="40" CssClass="form-control" 
                                        Text='<%# Bind("Address") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAddress" ControlToValidate="txtAddress" CssClass="text-danger" 
                                    ErrorMessage="Address is required field.">*
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtAddress" MaxLength="40" CssClass="form-control" 
                                        Text='<%# Bind("Address") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAddress" ControlToValidate="txtAddress" CssClass="text-danger" 
                                    ErrorMessage="Address is required field.">*
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblCity" Text='<%# Bind("City") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtCity" MaxLength="30" CssClass="form-control" 
                                        Text='<%# Bind("City") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCity" ControlToValidate="txtCity" CssClass="text-danger" 
                                    ErrorMessage="City is required field.">*
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtCity" MaxLength="30" CssClass="form-control" 
                                        Text='<%# Bind("City") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCity" ControlToValidate="txtCity" CssClass="text-danger" 
                                    ErrorMessage="City is required field.">*
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="State">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblState" Text='<%# Bind("State") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="col-xs-11">
                                    <asp:DropDownList runat="server" ID="ddlState" DataSourceID="SqlDataSource3" 
                                        DataTextField="StateName" DataValueField="StateCode" SelectedValue='<%# Bind("State") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvState" ControlToValidate="ddlState" CssClass="text-danger" 
                                    ErrorMessage="State is required field.">*
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11">
                                    <asp:DropDownList runat="server" ID="ddlState" DataSourceID="SqlDataSource3" 
                                        DataTextField="StateName" DataValueField="StateCode" SelectedValue='<%# Bind("State") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvState" ControlToValidate="ddlState" CssClass="text-danger" 
                                    ErrorMessage="State is required field.">*
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Zip Code">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblZipCode" Text='<%# Bind("ZipCode") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtZipCode" MaxLength="9" CssClass="form-control" 
                                        Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvZipCode" ControlToValidate="txtZipCode" CssClass="text-danger" 
                                    ErrorMessage="Zip Code is required field.">*
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtZipCode" MaxLength="9" CssClass="form-control" 
                                        Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvZipCode" ControlToValidate="txtZipCode" CssClass="text-danger" 
                                    ErrorMessage="Zip Code is required field.">*
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Phone Number">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblPhoneNumber" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtPhoneNumber" MaxLength="20" CssClass="form-control" 
                                        Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvPhoneNumber" ControlToValidate="txtPhoneNumber" CssClass="text-danger" 
                                    ErrorMessage="Phone Number is required field.">*
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11">
                                    <asp:TextBox runat="server" ID="txtPhoneNumber" MaxLength="20" CssClass="form-control" 
                                        Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvPhoneNumber" ControlToValidate="txtPhoneNumber" CssClass="text-danger" 
                                    ErrorMessage="Phone Number is required field.">*
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True">
                            <ItemStyle CssClass="warning"/>
                        </asp:CommandField>
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString='<%$ ConnectionStrings:HalloweenConnectionString %>'
                    SelectCommand="SELECT [Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber] FROM [Customers] WHERE [Email] = @Email" 
                    ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM [Customers] 
                                   WHERE [Email] = @original_Email 
                                   AND [LastName] = @original_LastName 
                                   AND [FirstName] = @original_FirstName 
                                   AND [Address] = @original_Address 
                                   AND [City] = @original_City 
                                   AND [State] = @original_State 
                                   AND [ZipCode] = @original_ZipCode 
                                   AND [PhoneNumber] = @original_PhoneNumber" 
                    InsertCommand="INSERT INTO [Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) 
                                   VALUES (@Email, @LastName, @FirstName, @Address, @City, @State, @ZipCode, @PhoneNumber)" 
                    OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE 
                                        [Customers] 
                                   SET 
                                        [LastName] = @LastName, 
                                        [FirstName] = @FirstName, 
                                        [Address] = @Address, 
                                        [City] = @City, 
                                        [State] = @State, 
                                        [ZipCode] = @ZipCode, 
                                        [PhoneNumber] = @PhoneNumber 
                                   WHERE 
                                        [Email] = @original_Email 
                                   AND  [LastName] = @original_LastName 
                                   AND  [FirstName] = @original_FirstName 
                                   AND  [Address] = @original_Address 
                                   AND  [City] = @original_City 
                                   AND  [State] = @original_State 
                                   AND  [ZipCode] = @original_ZipCode 
                                   AND  [PhoneNumber] = @original_PhoneNumber">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grdCustomers" Name="Email" PropertyName="SelectedValue" Type="String"/>
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_LastName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_FirstName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Address" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_State" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ZipCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_PhoneNumber" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                        <asp:Parameter Name="City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="State" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="PhoneNumber" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                        <asp:Parameter Name="City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="State" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="PhoneNumber" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_LastName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_FirstName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Address" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_State" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ZipCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_PhoneNumber" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                <p><asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="Please correct the following errors:" 
                        CssClass="text-danger" />
                <p><asp:Label ID="lblError" runat="server" 
                    EnableViewState="false" CssClass="text-danger"></asp:Label></p>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString='<%$ ConnectionStrings:HalloweenConnectionString %>' 
                    SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateName]">
                </asp:SqlDataSource>
            </div>

        </form>
    </main>
</div>
</body>
</html>