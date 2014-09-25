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
	/// 로그인을 위한 아이디와 비밀번호 찾기 페이지입니다.
	/// </summary>
	public partial class Find_my_id_and_password : Control.BasePage
	{
		#region Page_Load : 페이지 로드
		/// <summary>
		/// 페이지 로드
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Page_Load(object sender, EventArgs e)
		{
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
				DataTable _dt	= base.GetDataTable("WSP_USERS_R1"
					, _txtUserName.Text
					, _txtEmail.Text
					);
				if (_dt.Rows.Count == 0)
				{
					BANANA.Web.NotificationBar.Show("입력하신 정보에 해당하는 이용자는 존재하지 않습니다.", BANANA.Web.NotificationBar.NotificationType.Error);
					return;
				}
				else
				{
					string password		= base.GetDecryptTripleDES(_dt.Rows[0]["PWD"].ToString());
					int passLen			= password.Length;
					string temp			= passLen < 3 ? password : password.Substring(0, 3);
					for (int i = 0; i < passLen - 3; i++)
					{
						temp				+= "*";
					}
					_lblResult.Text		= string.Format("아이디는 {0}이며, 비밀번호는 {1}입니다. 비밀번호는 첫 3자리만 표시됩니다."
						, _dt.Rows[0]["USRID"].ToString()
						, temp
						);
				}
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion
	}
}