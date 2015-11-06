using BANANA.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Views.BRD
{
	/// <summary>
	/// 제  목: 게시물 상세보기/작성하기
	/// 작성자: 소정민(rhombask@gmail.com, 010-2865-4368)
	/// 작성일: 2015-10-05 22:09
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
					// 게시판DB
					base.SetListItem(_ddlDB, "Board", "");

					if (base.GetQueryString("IDX") != "")
					{
						ViewState["IDX"]	= base.GetQueryString("IDX");
						
						View(Convert.ToInt32(ViewState["IDX"]));
					}
					else
					{
						_txtWRITER_NAME.Text	= base.GetCookie("UserName");
						//_btnDel.Visible			= false;
					}

					_txtSUBJECT.Focus();
				}
				catch (Exception err)
				{
					BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
				}
			}
		}
		#endregion

		#region View : 게시물 상세 조회
		/// <summary>
		/// 게시물 상세 조회
		/// </summary>
		/// <param name="IDX"></param>
		void View(int IDX)
		{
			try
			{
				DataSet _ds					= base.GetDataSet("WSP_BRD1010_R2"
					, IDX
					);

				_ddlDB.SelectedValue		= _ds.Tables[0].Rows[0].Field<string>("DB").Trim();
				_txtWRITER_NAME.Text		= _ds.Tables[0].Rows[0].Field<string>("WRITER_NAME");
				_chkNOTICEFLAG.Checked		= _ds.Tables[0].Rows[0].Field<bool>("NOTICEFLAG");
				_txtSUBJECT.Text			= _ds.Tables[0].Rows[0].Field<string>("SUBJECT");
				_txtCONTENT.Text			= _ds.Tables[0].Rows[0].Field<string>("CONTENT").Replace("<br />", "\r\n").Replace("&nbsp;", " ");
			}
			catch
			{
				throw;
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
				// 뷰스테이트를 체크해서, 신규 게시물인지 수정인지 여부를 확인한다.
				if (ViewState["IDX"] == null)
				{
					// 신규
					base.BeginTransaction();

					DataTable _dt			= base.GetDataTable("WSP_BRD1010_C1"
						, _ddlDB.SelectedValue												// [1] 게시판DB
						, _txtSUBJECT.Text													// [2] 제목
						, base.GetCookie("USR_ID")											// [3] 작성자ID
						, _txtWRITER_NAME.Text												// [4] 작성자명
						, 0																	// [12] 조회수
						, _chkNOTICEFLAG.Checked											// [17] 공지여부
						, BANANA.Web.ServerVariables.REMOTE_ADDR							// [18] IP주소
						, System.DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")				// [19] 시스템등록일
						, _txtCONTENT.Text													// [21] 내용
						);

					base.CommitTransaction();

					ViewState["IDX"]	= Convert.ToInt32(_dt.Rows[0]["IDX"]);
					MessageBox.Alert("게시물 등록을 완료하였습니다.");
				}
				else
				{
					// 수정
					base.BeginTransaction();

					base.ExecuteNonQuery("WSP_BRD1010_U1"
						, Convert.ToInt32(ViewState["IDX"])									// [1] 일련번호
						, _txtSUBJECT.Text													// [3] 제목
						, _txtWRITER_NAME.Text												// [5] 작성자명
						//, Convert.ToInt32(_txtVIEWNUM.Text == "" ? "0" : _txtVIEWNUM.Text)	// [13] 조회수
						, _chkNOTICEFLAG.Checked											// [18] 공지여부
						, _txtCONTENT.Text													// [22] 내용
						);

					base.CommitTransaction();

					MessageBox.Alert("게시물 수정을 완료하였습니다.");
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