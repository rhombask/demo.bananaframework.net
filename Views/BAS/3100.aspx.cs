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
    /// 설  명: 기준정보관리 이용자관리 이용자정보관리 목록 화면
    /// </summary>
	public partial class _3100 : Controllers.BasePage
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
                // 사용자그룹코드
                SetListItem(_ddlUSER_GRP
                    , "COMMON"
                    , "W00"
                    , true
                    );

                SearchData();
            }
        }
        #endregion

        #region SearchData : 데이터 검색
        /// <summary>
        /// 데이터 검색
        /// </summary>
        void SearchData()
        {
            try
            {
                DataTable _dt = base.GetDataTable("WSP_BAS3100_R1"
                    , _ddlUSER_GRP.SelectedValue        // 사용자그룹코드
                    , _txtNAME.Text                     // 이용자명
                    , _txtUSRID.Text                    // 이용자ID
                    );

                FixedGrid1.DataSource = _dt;
                FixedGrid1.DataBind();
            }
            catch (Exception ex)
            {
                BANANA.Web.NotificationBar.Show(ex.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion

        #region FixedGrid1_PageIndexChanged : 그리드 페이징 이벤트
        /// <summary>
        /// 그리드 페이징 이벤트
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void FixedGrid1_PageIndexChanged(object sender, BANANA.Web.Controls.FixedGridPageIndexChangedEventArgs e)
        {
            SearchData();
        }
        #endregion

        #region FixedGrid1_PageSizeChanged : 그리드 Rows 변경 이벤트
        /// <summary>
        /// 그리드 Rows 변경 이벤트
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void FixedGrid1_PageSizeChanged(object sender, BANANA.Web.Controls.FixedGridPageSizeChangedEventArgs e)
        {
            SearchData();
        }
        #endregion

        #region _btnSearch_Click : 검색버튼 클릭 이벤트
        /// <summary>
        /// 검색버튼 클릭 이벤트
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void _btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                SearchData();
            }
            catch (Exception ex)
            {
                BANANA.Web.NotificationBar.Show(ex.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion

        #region _btnNew_Click : 신규 등록 버튼 클릭 이벤트
        /// <summary>
        /// 신규 등록 버튼 클릭 이벤트
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void _btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/BAS/3110.aspx", false);
        }
        #endregion

        #region _btnDel_Click : 계정 삭제 버튼 클릭 이벤트
        /// <summary>
        /// 계정 삭제 버튼 클릭 이벤트
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void _btnDel_Click(object sender, EventArgs e)
        {
            try
            {
                int _intRow = 0;
                // 그리드 헤더가 Row Index를 0으로 시작
                // 헤더 이하는 1로 for문을 돌려야 한다.
                for (int i = 1; i < FixedGrid1.Rows.Count; i++)
                {
                    BANANA.Web.Controls.CheckBox _CKF_ALL = (BANANA.Web.Controls.CheckBox)FixedGrid1.Rows[i].Cells["_CKF_ALL"].FindControl("_ckbSELECT");
                    BANANA.Web.Controls.HyperLink _hlUSRID = (BANANA.Web.Controls.HyperLink)FixedGrid1.Rows[i].Cells["USRID"].FindControl("_hlUSRID");

                    if (_CKF_ALL.Checked)
                    {
                        base.ExecuteNonQuery(
                            "WSP_BAS3110_D1"
                            , _hlUSRID.Text
                        );

                        _intRow++;
                    }
                }

                if (_intRow > 0)
                {
                    BANANA.Web.NotificationBar.Show("삭제하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info);
                    SearchData();
                }
            }
            catch (Exception ex)
            {
                BANANA.Web.NotificationBar.Show(ex.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion

    }
}