using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace demo.bananaframework.net
{
	public class Global : System.Web.HttpApplication
	{
		BANANA.Web.BasePage _bp		= new BANANA.Web.BasePage();

		protected void Application_Start(object sender, EventArgs e)
		{

		}

		protected void Session_Start(object sender, EventArgs e)
		{
			string _curSessionId	= _bp.GetCookie("DemoPermanentUniqueId");
			if (string.IsNullOrEmpty(_curSessionId))
			{
				_bp.SetCookie("DemoPermanentUniqueId", Session.SessionID, new DateTime(2020, 12, 31));
			}
		}

		protected void Application_BeginRequest(object sender, EventArgs e)
		{

		}

		protected void Application_AuthenticateRequest(object sender, EventArgs e)
		{

		}

		protected void Application_Error(object sender, EventArgs e)
		{

		}

		protected void Session_End(object sender, EventArgs e)
		{

		}

		protected void Application_End(object sender, EventArgs e)
		{

		}
	}
}