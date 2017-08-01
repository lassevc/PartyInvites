using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

namespace PartyInvites
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // We determine if the request we are responding to is the form being posted back to the server by checking the IsPostBack property
            if (IsPostBack)
            {
                // we create a new instance of the GuestResponse data model object
                GuestResponse rsvp = new GuestResponse();

                // The TryUpdateModel method performs a process called model binding where data values are used
                // from the browser request to populate the properties of our data model object
                if (TryUpdateModel(rsvp, new FormValueProvider(ModelBindingExecutionContext)))
                {
                    // We then store the GuestResponse object in our repository.
                    ResponseRepository.GetRepository().AddResponse(rsvp);

                    //  If the WillAttend property is true, then the user is coming to the party and we redirect him or her to the seeyouthere.html file.
                    if (rsvp.WillAttend.HasValue && rsvp.WillAttend.Value)
                    {
                        Response.Redirect("seeyouthere.html");
                    }
                    else
                    {
                        // Otherwise, we redirect the user to the sorryyoucantcome.html file.
                        Response.Redirect("sorryyoucantcome.html");

                    }
                }
            }
        }
    }
}