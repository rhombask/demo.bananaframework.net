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
    /// 설  명: 기준정보관리 이용자관리 화면관리 목록 화면
    /// </summary>
    public partial class _3400 : Controllers.BasePage
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
				DataTable _dt	= base.GetDataTable("WSP_BAS3400_R2");
				base.SetListItem(_ddlBIGMENU, _dt, "ID", "NAME", true);

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
                DataTable _dt = base.GetDataTable("WSP_BAS3400_R1"
					, _ddlBIGMENU.SelectedValue	// 대메뉴ID
					, _txtID.Text				// 프로그램ID
					, _txtNAME.Text				// 프로그램명
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
            Response.Redirect("/Views/BAS/3410.aspx", false);
        }
        #endregion
	}
}