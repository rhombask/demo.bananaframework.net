using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Framework.Common
{
	/// <summary>
	/// 비밀번호 변경
	/// </summary>
	public partial class Change_password : Control.BasePage
	{
		#region Page_Load : 페이지 로드
		/// <summary>
		/// 페이지 로드
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (base.GetCookie("UserID") == "")
			{
				_btnOK.Visible	= false;
				BANANA.Web.NotificationBar.Show("로그인이 필요합니다.", BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion

		#region _btnOK_Click : 확인 버튼 클릭 이벤트
		/// <summary>
		/// 확인 버튼 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnOK_Click(object sender, EventArgs e)
		{
			try
			{
				DataTable _dt	= base.GetDataTable("WSP_USERS_R2"
					, base.GetCookie("UserID")
					);
				if (base.GetDecryptTripleDES(_dt.Rows[0]["PWD"].ToString()) != _txtPassword1.Text)
				{
					BANANA.Web.NotificationBar.Show("기존 비밀번호가 일치하지 않습니다.", BANANA.Web.NotificationBar.NotificationType.Error);
					return;
				}
				else if (_txtPassword2.Text != _txtPassword3.Text)
				{
					BANANA.Web.NotificationBar.Show("신규 비밀번호와 비밀번호 확인이 일치하지 않습니다.", BANANA.Web.NotificationBar.NotificationType.Error);
					return;
				}

				base.ExecuteNonQuery("WSP_USERS_U1"
					, base.GetCookie("UserID")
					, base.GetEncryptTripleDES(_txtPassword2.Text)
					, base.GetCookie("UserID")
					, base.GetCookie("UserName")
					);

				BANANA.Web.NotificationBar.Show("비밀번호가 변경 되었습니다.", BANANA.Web.NotificationBar.NotificationType.Info, 3000, "window.close();");
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion
	}
}