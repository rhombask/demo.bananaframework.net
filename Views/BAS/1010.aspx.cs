using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Views.BAS
{
	/// <summary>
	/// 제  목: 메인코드 상세
	/// 설  명: 
	/// </summary>
	public partial class _1010 : Controllers.BasePage
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
				try
				{
					ViewState["MainCode"]		= base.GetQueryString("MAIN_CODE");
					if (ViewState["MainCode"].ToString() != "")
					{
						DataTable _dt		= base.GetDataTable("WSP_BAS1000_R2"
							, ViewState["MainCode"].ToString()
							);

						_txtMAIN_CODE.Text			= _dt.Rows[0]["MAIN_CODE"].ToString();
						_txtCODE_NAME.Text			= _dt.Rows[0]["CODE_NAME"].ToString();
						_txtBIGO.Text				= _dt.Rows[0]["BIGO1"].ToString();
						_dvSYSINFO.InnerHtml		= _dt.Rows[0]["SYSINFO"].ToString();

						_txtMAIN_CODE.ReadOnly		= true;
					}
				}
				catch (Exception err)
				{
					BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
				}
			}
		}
		#endregion

		#region _btnSave_Click : 저장 버튼 클릭 이벤트
		/// <summary>
		/// 저장 버튼 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnSave_Click(object sender, EventArgs e)
		{
			try
			{
				// 신규
				if (ViewState["MainCode"].ToString() == "")
				{
					base.ExecuteNonQuery("WSP_BAS1000_C1"
						, _txtMAIN_CODE.Text			// 메인코드
						, _txtCODE_NAME.Text			// 코드명
						, _txtBIGO.Text					// 비고
						, base.GetCookie("UserID")		// 시스템등록자ID
						, base.GetCookie("UserName")	// 시스템등록자명
						);
				}
				// 수정
				else
				{
					base.ExecuteNonQuery("WSP_BAS1000_U1"
						, _txtMAIN_CODE.Text			// 메인코드
						, _txtCODE_NAME.Text			// 코드명
						, _txtBIGO.Text					// 비고
						, base.GetCookie("UserID")		// 시스템수정자ID
						, base.GetCookie("UserName")	// 시스템수정자명
						);
				}

				BANANA.Web.NotificationBar.Show("저장하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info);
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion

		#region _btnList_Click : 목록 버튼 클릭 이벤트
		/// <summary>
		/// 목록 버튼 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnList_Click(object sender, EventArgs e)
		{
			Response.Redirect("/Views/BAS/1000.aspx", false);
		}
		#endregion

		#region _btnDel_Click : 삭제 버튼 클릭 이벤트
		/// <summary>
		/// 삭제 버튼 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnDel_Click(object sender, EventArgs e)
		{
			try
			{
				base.ExecuteNonQuery("WSP_BAS1000_D1"
					, _txtMAIN_CODE.Text
					);

				BANANA.Web.NotificationBar.Show("삭제하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info, 2000, "location.href='/Views/BAS/1000.aspx';");
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion
	}
}