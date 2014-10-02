using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BANANA.Web.Controls;

namespace demo.bananaframework.net.View.BAS
{
    /// <summary>
    /// 설  명: 기준정보관리 이용자관리 권한그룹관리 상세 화면
    /// </summary>
    public partial class _3210 : Control.BasePage
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
                    string _total_code = base.GetQueryString("TOTAL_CODE");
                    if (_total_code != "")
                    {
                        DataTable _dt = base.GetDataTable(
                            "WSP_BAS1000_R3"
                            , _total_code
                            );

                        _lblTOTAL_CODE.Text = _dt.Rows[0]["TOTAL_CODE"].ToString();
                        _lblMAIN_CODE.Text = _dt.Rows[0]["MAIN_CODE"].ToString();
                        _lblSUB_CODE.Text = _dt.Rows[0]["SUB_CODE"].ToString();
                        _txtCODE_NAME.Text = _dt.Rows[0]["CODE_NAME"].ToString();
                        _chkDISPLAYYN.Checked = Convert.ToBoolean(_dt.Rows[0]["DISPLAYYN"].ToString());
                        _txtORDERBY.Text = _dt.Rows[0]["ORDERBY"].ToString();
                        _txtBIGO1.Text = _dt.Rows[0]["BIGO1"].ToString();
                        _txtBIGO2.Text = _dt.Rows[0]["BIGO2"].ToString();
                        _txtBIGO3.Text = _dt.Rows[0]["BIGO3"].ToString();
                        _txtBIGO4.Text = _dt.Rows[0]["BIGO4"].ToString();
                        _txtBIGO5.Text = _dt.Rows[0]["BIGO5"].ToString();
                        _txtBIGO6.Text = _dt.Rows[0]["BIGO6"].ToString();
                        _dvSYSINFO.InnerHtml = _dt.Rows[0]["SYSINFO"].ToString();
                    }
                    else
                    {
                        _lblMAIN_CODE.Text = "W00";
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
                if (_lblTOTAL_CODE.Text == "")
                {
                    base.ExecuteNonQuery(
                        "WSP_BAS3210_C1"
                        , _lblMAIN_CODE.Text			// 메인코드
                        , _txtCODE_NAME.Text			// 코드명
                        , _chkDISPLAYYN.Checked			// 사용여부
                        , base.GetInteger(_txtORDERBY)	// 순서
                        , _txtBIGO1.Text				// 비고1
                        , _txtBIGO2.Text				// 비고2
                        , _txtBIGO3.Text				// 비고3
                        , base.GetDecimal(_txtBIGO4)	// 비고4
                        , base.GetDecimal(_txtBIGO5)	// 비고5
                        , base.GetDecimal(_txtBIGO6)	// 비고6
                        , string.Empty                  // 비고
                        , base.GetCookie("UserID")		// 시스템등록자ID
                        , base.GetCookie("UserName")	// 시스템등록자명
                        );
                }
                // 수정
                else
                {
                    base.ExecuteNonQuery(
                        "WSP_BAS1000_U2"
                        , _lblTOTAL_CODE.Text			// 공통코드
                        , _lblMAIN_CODE.Text			// 메인코드
                        , _lblSUB_CODE.Text				// 서브코드
                        , _txtCODE_NAME.Text			// 코드명
                        , _chkDISPLAYYN.Checked			// 사용여부
                        , base.GetInteger(_txtORDERBY)	// 순서
                        , _txtBIGO1.Text				// 비고1
                        , _txtBIGO2.Text				// 비고2
                        , _txtBIGO3.Text				// 비고3
                        , base.GetDecimal(_txtBIGO4)	// 비고4
                        , base.GetDecimal(_txtBIGO5)	// 비고5
                        , base.GetDecimal(_txtBIGO6)	// 비고6
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
            Response.Redirect("/View/BAS/3200.aspx", false);
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
                base.ExecuteNonQuery(
                    "WSP_BAS3210_D1"
                    , _lblTOTAL_CODE.Text
                    );

                BANANA.Web.NotificationBar.Show("삭제하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info, 2000, "location.href='/View/BAS/3200.aspx';");
            }
            catch (Exception err)
            {
                BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion
    }
}