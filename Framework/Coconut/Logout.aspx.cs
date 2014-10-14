using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Framework.Coconut
{
	public partial class Logout : Control.BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			base.SetCookie("UserID", "");
			base.SetCookie("UserName", "");
			base.SetCookie("UserGroupName", "");
            base.SetCookie("UserGroupCode", "");

			Response.Redirect("/Default.aspx", false);
		}
	}
}