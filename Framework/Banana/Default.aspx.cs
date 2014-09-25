using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BANANA.Web;

namespace demo.bananaframework.net.Framework.Banana
{
	/// <summary>
	/// 바나나 템플릿의 첫 페이지
	/// </summary>
	public partial class Default : Control.BasePage
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
				if (base.GetCookie("UserId") == "")
				{
					Response.Redirect("/Default.aspx", false);
				}

				// 상단메뉴 바인딩
                // 2014-09-13 메뉴 화면 권한을 위한 수정 by ISHAN
				DropDownMenu1.Callback		= "DropDown_Callback";
                DropDownMenu1.DataSource    = base.GetDataTable("WSP_USER_PROGRAM_R1", base.GetCookie("UserGroupCode").Trim());
				DropDownMenu1.DataBind();
				
				_lblWelcome.Text	= string.Format("[{0}] {1}({2})님, 환영합니다."
					, base.GetCookie("UserGroupName").Trim()
					, base.GetCookie("UserName").Trim()
					, base.GetCookie("UserId").Trim()
					);
			}
		}
		#endregion

		#region _btnLogout_Click : 로그아웃 버튼 클릭
		/// <summary>
		/// 로그아웃 버튼 클릭
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnLogout_Click(object sender, EventArgs e)
		{
			try
			{
				base.SetCookie("UserID", "");
				base.SetCookie("UserName", "");
				base.SetCookie("UserGroupName", "");
                base.SetCookie("UserGroupCode", "");

				Response.Redirect("/Default.aspx", false);
			}
			catch (Exception err)
			{
				MessageBox.Show(err.Message);
			}
		}
		#endregion
	}
}