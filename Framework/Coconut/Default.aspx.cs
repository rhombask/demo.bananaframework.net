using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Framework.Coconut
{
	/// <summary>
	/// 코코넛 템플릿의 첫 페이지
	/// 코코넛 템플릿은 본사/지사/대리점은 로그인 할 수 없습니다.
	/// </summary>
	public partial class Default : Control.BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				// 로그인 여부 확인
				if (base.GetCookie("UserId") == "")
				{
					Response.Redirect("/Default.aspx", false);
				}
				// 본사/지사/대리점 로그인 여부 확인
				else if (
					(base.GetCookie("UserGroupCode").Substring(0, 3) == "A01")
					|| (base.GetCookie("UserGroupCode").Substring(0, 1) == "W")
					)
				{
					Response.Redirect("/Default.aspx", false);
				}
			}
		}
	}
}