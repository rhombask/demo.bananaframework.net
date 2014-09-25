using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net
{
	/// <summary>
	/// 로그인 페이지입니다.
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
			}
        }
        #endregion

		#region _btnLOGIN_Click : 로그인버튼 클릭
		/// <summary>
		/// 로그인버튼 클릭
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnLOGIN_Click(object sender, EventArgs e)
		{
			try
			{
				// 로그인
                DataTable _dt = base.GetDataTable("WSP_LOGIN"
                    , _txtUserID.Text.Trim()
                    );

                if (base.GetDecryptTripleDES(_dt.Rows[0]["PWD"].ToString()) != _txtUserPassword.Text.Trim())
                {
					BANANA.Web.NotificationBar.Show("비밀번호가 틀립니다.", BANANA.Web.NotificationBar.NotificationType.Error);
                    return;
                }

                base.SetCookie("UserID", _txtUserID.Text.Trim());
                base.SetCookie("UserName", _dt.Rows[0]["NAME"].ToString());
                base.SetCookie("UserGroupName", _dt.Rows[0]["USER_GRP"].ToString());
                base.SetCookie("UserGroupCode", _dt.Rows[0]["USER_GRP_CD"].ToString());
                Response.Redirect("/Framework/Banana/Default.aspx", false);
			}
			catch (Exception err)
			{
				base.SetCookie("UserID", "");
				base.SetCookie("UserName", "");
				base.SetCookie("UserGroupName", "");
                base.SetCookie("UserGroupCode", "");

                BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion
	}
}