using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.View.MBR
{
	/// <summary>
	/// 회원정보 등록/수정
	/// </summary>
	public partial class _1010 : Control.BasePage
	{
		/// <summary>
		/// 페이지 로드
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				if (!IsPostBack)
				{
					base.SetListItem(_ddlBK_CD, "Common", "A10", true);
					base.SetListItem(_ddlJIKUP_CD, "Common", "A02", true);
				}
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
	}
}