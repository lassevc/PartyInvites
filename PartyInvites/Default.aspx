<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PartyInvites.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="PartyStyles.css" />
</head>
<body>
    <form id="rsvpform" runat="server">
        <div>
            <h1>New Year's Eve at Jacqui's</h1>
            <p>We're goint to have an exciting party. And you're invited!</p>
        </div>
        <% // ASP.NET Web Forms control "ValidationSummary" displays validation errors (works together with Required-attributes in class-file) %>
        <asp:ValidationSummary ID="validationSummary" runat="server" ShowModelStateErrors="true" />

        <% // runat="server": if the tags don’t have this attribute/value combination, the model binding process isn’t able to find the values submitted in the HTML form %>
        <div><label>Your name:</label><input type="text" id="name" runat="server"/></div>
        <div><label>Your email:</label><input type="email" id="email" runat="server" /></div>
        <div><label>Your phone:</label><input type="tel" id="phone" runat="server" /></div>
        <div>
            <label>Will you attend?</label>
            <select id="willattend" runat="server">
                <option value="">Choose an Option</option>
                <option value="true">Yes</option>
                <option value="false">No</option>
            </select>
        </div>
        <div>
            <button type="submit">Submit RSVP</button>
        </div>
    </form>
</body>
</html>
