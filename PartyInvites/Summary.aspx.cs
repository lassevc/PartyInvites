using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace PartyInvites
{
    public partial class Summary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GetNoShowHtml()
        {
            StringBuilder html = new StringBuilder();
            var noData = ResponseRepository.GetRepository().GetAllResponses().Where(r => r.WillAttend.HasValue && r.WillAttend.Value == false);

            foreach (var rsvp in noData)
            {
                html.Append(String.Format($"<tr><td>{rsvp.Name}</td><td>{rsvp.Email}</td><td>{rsvp.Phone}</td></tr>"));
            }
            return html.ToString();
        }
    }
}