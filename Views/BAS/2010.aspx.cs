using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BANANA.Web.Controls;

namespace demo.bananaframework.net.Views.BAS
{
    /// <summary>
    /// 설  명: 기준정보관리 휴일관리 상세 화면
    /// </summary>
    public partial class _2010 : Controllers.BasePage
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
                    ViewState["WKDAY"] = base.GetQueryString("WKDAY");

                    // 신규 등록일 경우
                    if (string.IsNullOrEmpty(ViewState["WKDAY"].ToString()))
                    {
                        _dptWKDAY.Date = DateTime.Now.ToString("yyyy-MM-dd");
                        _dptWKDAY.ReadOnly = false;
                        _btnDel.Visible = false;
                    }
                    // 수정일 경우
                    else
                    {
                        _dptWKDAY.ReadOnly = true;
                        _btnDel.Visible = true;

                        DataTable _dt = base.GetDataTable(
                            "WSP_BAS2010_R1"
                            , ViewState["WKDAY"].ToString()
                            );

                        if (_dt.Rows.Count > 0)
                        {
                            _dptWKDAY.Date = _dt.Rows[0]["WKDAY"].ToString();
                            _txtWKMEMO.Text = _dt.Rows[0]["WKMEMO"].ToString();
                            _dvSYSINFO.InnerHtml = _dt.Rows[0]["SYSINFO"].ToString();
                        }
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
                if (string.IsNullOrEmpty(ViewState["WKDAY"].ToString()))
                {
                    base.ExecuteNonQuery(
                        "WSP_BAS2010_C1"
                        , _dptWKDAY.Date			    // 공휴일자
                        , _txtWKMEMO.Text			    // 메모
                        , string.Empty                  // 비고
                        , base.GetCookie("UserID")		// 시스템등록자ID
                        , base.GetCookie("UserName")	// 시스템등록자명
                        );
                }
                // 수정
                else
                {
                    base.ExecuteNonQuery(
                        "WSP_BAS2010_U1"
                        , _dptWKDAY.Date			    // 공휴일자
                        , _txtWKMEMO.Text			    // 메모
                        , string.Empty                  // 비고
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
            Response.Redirect("/Views/BAS/2000.aspx", false);
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
                base.ExecuteNonQuery("WSP_BAS2010_D1"
                    , _dptWKDAY.Date			    // 공휴일자
                    );

                BANANA.Web.NotificationBar.Show("삭제하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info, 2000, "location.href='/Views/BAS/2000.aspx';");
            }
            catch (Exception err)
            {
                BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion
    }
}