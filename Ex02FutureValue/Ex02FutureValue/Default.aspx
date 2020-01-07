<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ex02FutureValue.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 2: Future Value</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 95px;
        }
        .auto-style2 {
            height: 20px;
        }
        .auto-style3 {
            width: 151px;
        }
        .auto-style4 {
            height: 20px;
            width: 151px;
        }
    </style>
</head>
<body>
    <img src="Images/MurachLogo.jpg" alt="Murach Logo" />
    <h1>401K Future Value Calculator</h1>
    <form id="form1" runat="server">
    <div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Monthly investment:</td>
                <td>
                    <asp:DropDownList ID="ddlMonthlyInvestment" runat="server" Height="20px" Width="116px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Annual interest rate:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtInterestRate" runat="server" Width="101px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Number of years:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtYears" runat="server" Width="101px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Future value:</td>
                <td>
                    <asp:Label ID="lblFutureValue" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate" Width="97px" OnClick="btnCalculate_Click" />
                </td>
                <td>
                    <asp:Button ID="btnClear" runat="server" CausesValidation="False" Text="Clear" Width="97px" OnClick="btnClear_Click" />
                </td>
            </tr>
        </table>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtInterestRate" Display="Dynamic" ErrorMessage="Interest rate is required." ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtInterestRate" Display="Dynamic" 
            ErrorMessage="Interest Rate must range from 1 to 20." MinimumValue="1" MaximumValue="20" Type="Double" ForeColor="Red">
        </asp:RangeValidator><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtYears" Display="Dynamic" ErrorMessage="Number of years is required." ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtYears" Display="Dynamic" 
            ErrorMessage="Number of years must range from 1 to 40." MinimumValue="1" MaximumValue="40" Type="Integer" ForeColor="Red">
        </asp:RangeValidator>
    </div>
    </form>
</body>
</html>
