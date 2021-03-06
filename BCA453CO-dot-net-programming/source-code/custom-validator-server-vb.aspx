<%@ Page Language="VB" %>
<script runat="server">
  Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
      If Page.IsValid Then
          Label1.Text = "VALID ENTRY!"
      End If
  End Sub
  Sub ValidateNumber(sender As Object, args As ServerValidateEventArgs)
      Try
          Dim num As Integer = Integer.Parse(args.Value)
          args.IsValid = ((num mod 5) = 0)
      Catch ex As Exception
          args.IsValid = False
      End Try
  End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
  <head runat="server">
    <title>CustomValidator</title>
  </head>
  <body>
    <form id="form1" runat="server">
      <div>
        <p>
          Number:
          <asp:TextBox ID="TextBox1"
            Runat="server"></asp:TextBox>
          &nbsp;
          <asp:CustomValidator ID="CustomValidator1"
            Runat="server" ControlToValidate="TextBox1"
            ErrorMessage="Number must be divisible by 5"
            OnServerValidate="ValidateNumber"></asp:CustomValidator>
        </p>
        <p>
          <asp:Button ID="Button1" OnClick="Button1_Click"
            Runat="server" Text="Button"></asp:Button>
        </p>
        <p>
          <asp:Label ID="Label1" Runat="server"></asp:Label>
        </p>
      </div>
    </form>
  </body>
</html>