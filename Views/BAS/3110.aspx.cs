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
    /// 설  명: 기준정보관리 이용자관리 이용자정보관리 상세 화면
    /// </summary>
    public partial class _3110 : Controllers.BasePage
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
                ViewState["USRID"] = base.GetQueryString("USRID");

                try
                {
                    // 사용자그룹코드
                    SetListItem(_ddlUSER_GRP
                        , "COMMON"
                        , "W00"
                        , false
                        );

                    // 신규 등록일 경우
                    if (string.IsNullOrEmpty(ViewState["USRID"].ToString()))
                    {
                        _txtUSRID.ReadOnly = false;
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
                _txtUSRID.ReadOnly = true;
                _btnDelete.Visible = true;

                DataTable _dt		= base.GetDataTable("WSP_BAS3110_R1"
                    , ViewState["USRID"].ToString()
                    );

                _txtNAME.Text				= _dt.Rows[0]["NAME"].ToString();
                _txtUSRID.Text				= _dt.Rows[0]["USRID"].ToString();
				/*
				 * 암호화된 비밀번호는 복호화해서 출력하도록 합니다.
				 */
                _txtPWD.Text				= base.GetDecryptTripleDES(_dt.Rows[0]["PWD"].ToString());
                _ddlUSER_GRP.SelectedValue	= _dt.Rows[0]["USER_GRP_CD"].ToString();
                _txtTELNO.Text				= _dt.Rows[0]["TELNO"].ToString();
                _txtEMAIL.Text				= _dt.Rows[0]["EMAIL"].ToString();
                _txtBIGO.Text				= _dt.Rows[0]["BIGO"].ToString();
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
                if (string.IsNullOrEmpty(ViewState["USRID"].ToString()))
                {
                    base.ExecuteNonQuery("WSP_BAS3110_C1"
                        , _txtUSRID.Text                            // 이용자ID
                        , base.GetEncryptTripleDES(_txtPWD.Text)    // 비밀번호
                        , _txtNAME.Text                             // 이용자명
                        , _ddlUSER_GRP.SelectedValue                // 사용자그룹코드
                        , _txtTELNO.Text                            // 연락처
                        , _txtEMAIL.Text                            // 이메일
                        , _txtBIGO.Text                             // 비고
                        , base.GetCookie("UserID")                  // 시스템등록자ID
                        , base.GetCookie("UserName")                // 시스템등록자명
                        );
                }
                else
                {
                    base.ExecuteNonQuery("WSP_BAS3110_U1"
                        , _txtUSRID.Text                            // 이용자ID
                        , base.GetEncryptTripleDES(_txtPWD.Text)    // 비밀번호
                        , _txtNAME.Text                             // 이용자명
                        , _ddlUSER_GRP.SelectedValue                // 사용자그룹코드
                        , _txtTELNO.Text                            // 연락처
                        , _txtEMAIL.Text                            // 이메일
                        , _txtBIGO.Text                             // 비고
                        , base.GetCookie("UserID")                  // 시스템수정자ID
                        , base.GetCookie("UserName")                // 시스템수정자명
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
                    "WSP_BAS3110_D1"
                    , ViewState["USRID"].ToString()           // 이용자ID
                    );

                BANANA.Web.NotificationBar.Show("삭제하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info, 2000, "location.href='/View/BAS/3100.aspx';");
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
            Response.Redirect("/View/BAS/3100.aspx", false);
        }
        #endregion
    }
}