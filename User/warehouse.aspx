<%@ Page Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="warehouse.aspx.cs" Inherits="User_warehouse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-9">
        <h4 class="font-alt mb-0">Warehouse</h4>
        <div class="col-sm-12" style="margin: 0; padding: 0;">
            <div class="form-group">
                <asp:Label ID="lblMessage" CssClass="red" runat="server"></asp:Label>
            </div>
        </div>
        <div class="col-sm-12" style="margin: 0; padding: 0;">
            <div class="form-group">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control input-lg" placeholder="Enter Name"></asp:TextBox>
            </div>
        </div>
        <asp:FileUpload ID="fu" runat="server" />
        <br>
        <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" Text="Submit" CssClass="btn btn-primary btn-round" />
    </div>
</asp:Content>

