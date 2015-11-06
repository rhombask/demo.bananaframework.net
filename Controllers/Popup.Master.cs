using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Controllers
{
	/// <summary>
	/// 팝업 마스터 페이지
	/// 팝업 페이지들에서는 기본 마스터 페이지와는 다른 템플릿이 필요하므로, 별도의 마스터 페이지에서 관리하게 됩니다.
	/// </summary>
	public partial class Popup : Controllers.MasterPage
	{
		#region Page_Load : 페이지 로드
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
					// 주소를 직접 입력하고 들어오는 경우에는 /Default.aspx로 이동 시킨다.
					if (BANANA.Web.ServerVariables.HTTP_REFERER.IndexOf(BANANA.Web.ServerVariables.SERVER_NAME) == -1)
					{
						string url	= string.Format("/Common/500.aspx?Message={0}", Server.UrlEncode("화면에 직접 접근권한이 없습니다. 메뉴를 통해서 접근하세요."));
						Response.Redirect(url, false);
					}

					// 네비게이터 조회
					string _path_info	= BANANA.Web.ServerVariables.PATH_INFO;
					DataTable _dt		= base.GetDataTable("WSP_USER_PROGRAM_R2"
						, _path_info
						);
					if (_dt.Rows.Count > 0)
					{
						string[] temp		= _path_info.Split('/');
						navigator.InnerHtml	= _dt.Rows[0]["PATH"].ToString();
						navigator.InnerHtml	+= string.Format("({0}{1})&nbsp;", temp[2], temp[3].Replace(".aspx", ""));
					}
					else
					{
						navigator.InnerHtml	= "네비게이터 정보가 없습니다.&nbsp;";
					}
				}
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion

		#region OnInit : 권한 처리
		/// <summary>
		/// 권한 처리
		/// </summary>
		/// <param name="e"></param>
		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);

			/*
			 * ※ 주의: 각 서브 페이지들에서 비하인드 코드로 컨트롤의 enabled 값을 지정해 주려면, 본 함수에서 권한 처리를 해 주는 것이 좋다.
			 *			Page_Load에서 처리하지 말자.
			 */
			try
			{
				// 쿠키 타임아웃일 경우 로그인 화면으로 이동
				if (base.GetCookie("UserID") == "")
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "goBack", "alert('유효한 시간이 경과되어서 로그아웃 처리되었습니다. 다시 로그인 하세요.'); parent.location.href = '/Default.aspx';", true);
				}
				// 화면별 권한 처리
				else
				{
					object o		= Page.Form.FindControl("_cphBody");

					if (IsContentPlaceHolder(o))
					{
						ContentPlaceHolder _c	= (ContentPlaceHolder)o;

						for (int j = 0; j < _c.Controls.Count; j++)
						{
							object o2 = _c.Controls[j];

							if (IsHtmlContainerControl(o2))
							{
								HtmlContainerControl _h = (HtmlContainerControl)o2;
								for (int k = 0; k < _h.Controls.Count; k++)
								{
									object o3 = _h.Controls[k];

									if (IsBANANAButton(o3))
									{
										// 버튼 권한 처리
										PermissionRoll(o3);
									}
								}
							}
							else
							{
								if (IsBANANAButton(o2))
								{
									// 버튼 권한 처리
									PermissionRoll(o2);
								}
							}
						}
					}
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