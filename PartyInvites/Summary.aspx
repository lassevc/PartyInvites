<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="PartyInvites.Summary" %>
<% // <% = service-side scripting delimiters although they are more commonly referred to as code nuggets %>
<% // <%@ = directive - allow you to perform an action that affects the entire Web Form %>
<% //  Import directive brings a namespace from the project into scope so that we can refer to classes without having to qualify the class name %>
<%@ Import Namespace="PartyInvites" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="PartyStyles.css" />
</head>
<body>
    <h2>RSVP Summary</h2>

    <h3>People Who Will Attend</h3>
    <table>
        <thead>
            <tr><th>Name</th><th>Email</th><th>Phone</th></tr>
        </thead>

        <tbody>
            <% // code block - C# statements to generate a set of HTML elements that are rows in the table element listing the people who have accepted invitations - LINQ Where method
                var yesData = ResponseRepository.GetRepository().GetAllResponses().Where(r => r.WillAttend.HasValue && r.WillAttend.Value == true);
                foreach (var rsvp in yesData)
                {
                    // The String.format allows us to compose HTML strings
                    string htmlString = String.Format($"<tr><td>{rsvp.Name}</td><td>{rsvp.Email}</td><td>{rsvp.Phone}</td></tr>");
                    // we use the Response.Write method to add the HTML to the output sent to the browser
                    Response.Write(htmlString);
                }

                %>
        </tbody>
    </table>

    <h3>People Who Will Not Attend</h3>
    <table>
        <thead>
            <tr><th>Name</th><th>Email</th><th>Phone</th></tr>
        </thead>

        <tbody>
            <% // This tells ASP.NET to insert the result of the method into the output sent to the browser %>
            <% // Same result as above (except for showing people who can't attend), but a much neater and readable approach - code/method is found in code-behind-file %>
            <%= GetNoShowHtml() %>
        </tbody>
    </table>
    
</body>
</html>
