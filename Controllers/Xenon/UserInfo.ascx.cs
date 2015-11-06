using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Controllers.Xenon
{
	public partial class UserInfo : BANANA.Web.BaseControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			_ltUserName.Text	= base.GetCookie("UserName");
		}
	}
}