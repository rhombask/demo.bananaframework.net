using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Common
{
	/// <summary>
	/// 404 페이지
	/// </summary>
	public partial class _404 : System.Web.UI.Page
	{
		#region Page_Load : 페이지 로드
		/// <summary>
		/// 페이지 로드
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				object message	= Request.QueryString["Message"];
				if (message != null)
				{
					Message.InnerHtml	= message.ToString();
					this.Title			= message.ToString();
				}
				else
				{
					Message.InnerHtml	= "페이지를 찾을 수 없습니다.";
				}
			}
		}
		#endregion
	}
}