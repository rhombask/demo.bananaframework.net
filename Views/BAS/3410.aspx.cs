using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BANANA.Web;

namespace demo.bananaframework.net.Views.BAS
{
    /// <summary>
    /// 설  명: 기준정보관리 이용자관리 화면관리 상세 화면
    /// </summary>
    public partial class _3410 : Controllers.BasePage
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
                ViewState["ID"] = base.GetQueryString("ID");

                try
                {
                    // 신규 등록일 경우
                    if (string.IsNullOrEmpty(ViewState["ID"].ToString()))
                    {
                        _txtID.ReadOnly = false;
                        _btnDelete.Visible = false;
                    }
                    // 수정일 경우
                    else
                    {
						ViewData();
                    }
                }
                catch (Exception ex)
                {
                    BANANA.Web.NotificationBar.Show(ex.Message, BANANA.Web.NotificationBar.NotificationType.Error);
                }
            }
        }
        #endregion

		#region ViewData : 데이터 상세보기
		/// <summary>
		/// 데이터 상세보기
		/// </summary>
		void ViewData()
		{
			try
			{
                _txtID.ReadOnly			= true;
                _btnDelete.Visible		= true;

                DataTable _dt			= base.GetDataTable("WSP_BAS3410_R1"
                    , ViewState["ID"].ToString()
                    );
							
                _txtID.Text					= _dt.Rows[0]["ID"].ToString();
                _txtNAME.Text				= _dt.Rows[0]["NAME"].ToString();
                _rblUSE_YN.SelectedValue	= _dt.Rows[0]["USE_YN"].ToString();
                _txtURL.Text				= _dt.Rows[0]["URL"].ToString();
                _txtPID.Text				= _dt.Rows[0]["PID"].ToString();
                _txtORDNO.Text				= _dt.Rows[0]["ORDNO"].ToString();
                _txtCHILD_ID.Text			= _dt.Rows[0]["CHILD_ID"].ToString();
                _txtNOTE.Text				= _dt.Rows[0]["NOTE"].ToString();
				_dvSYSINFO.InnerHtml		= _dt.Rows[0]["SYSINFO"].ToString();
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
                if (string.IsNullOrEmpty(ViewState["ID"].ToString()))
                {
                    base.ExecuteNonQuery("WSP_BAS3410_C1"
                        , _txtID.Text                   // 프로그램ID
                        , _txtNAME.Text                 // 프로그램명
                        , _txtURL.Text                  // 프로그램경로
                        , _txtPID.Text                  // 부모 프로그램ID
                        , _txtORDNO.Text                // 순번
                        , _txtCHILD_ID.Text             // 자식 프로그램 ID(구분값 ;)
                        , _rblUSE_YN.SelectedValue      // 프로그램 사용 여부
                        , _txtNOTE.Text                 // 메모
                        , ""							// 비고
                        , base.GetCookie("UserID")		// 시스템등록자ID
                        , base.GetCookie("UserName")	// 시스템등록자명
                        );
                }
                else
                {
                    base.ExecuteNonQuery("WSP_BAS3410_U1"
                        , _txtID.Text                   // 프로그램ID
                        , _txtNAME.Text                 // 프로그램명
                        , _txtURL.Text                  // 프로그램경로
                        , _txtPID.Text                  // 부모 프로그램ID
                        , _txtORDNO.Text                // 순번
                        , _txtCHILD_ID.Text             // 자식 프로그램 ID(구분값 ;)
                        , _rblUSE_YN.SelectedValue      // 프로그램 사용 여부
                        , _txtNOTE.Text                 // 메모
                        , ""							// 비고
                        , base.GetCookie("UserID")		// 시스템등록자ID
                        , base.GetCookie("UserName")	// 시스템등록자명
                        );
                }

                BANANA.Web.NotificationBar.Show("저장하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info);
            }
            catch (Exception ex)
            {
                BANANA.Web.NotificationBar.Show(ex.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion

        #region _btnDelete_Click : 삭제 버튼 클릭 이벤트
        /// <summary>
        /// 삭제 버튼 클릭 이벤트
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void _btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                base.ExecuteNonQuery(
                    "WSP_BAS3410_D1"
                    , ViewState["ID"].ToString()           // 이용자ID
                    );

                BANANA.Web.NotificationBar.Show("삭제하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info, 2000, "location.href='/View/BAS/3400.aspx';");
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
            Response.Redirect("/View/BAS/3400.aspx", false);
        }
        #endregion
    }
}