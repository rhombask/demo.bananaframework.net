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
    /// 설  명: 기준정보관리 휴일관리 목록 화면
    /// </summary>
    public partial class _2000 : Control.BasePage
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
                    for (int i = -5; i < 5; i++)
                    {
                        _ddlYYYY.Items.Add(new ListItem(string.Format("{0}년", DateTime.Now.AddYears(i).Year), DateTime.Now.AddYears(i).Year.ToString()));
                    }

                    _ddlYYYY.SelectedValue = DateTime.Now.Year.ToString();

                    SearchData();
                }
                catch (Exception ex)
                {
                    BANANA.Web.NotificationBar.Show(ex.Message, BANANA.Web.NotificationBar.NotificationType.Error);
                }
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
                DataTable _dt = base.GetDataTable(
                    "WSP_BAS2000_R1"
                    , _ddlYYYY.SelectedValue
                    );

                FixedGrid1.DataSource = _dt;
                FixedGrid1.DataBind();
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region _btnSearch_Click : 검색 버튼 클릭 이벤트
        /// <summary>
        /// 검색 버튼 클릭 이벤트
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void _btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                SearchData();
            }
            catch (Exception err)
            {
                BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion

        #region _btnNew_Click : 공휴일 등록 버튼 클릭 이벤트
        /// <summary>
        /// 공휴일 등록 버튼 클릭 이벤트
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void _btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/BAS/2010.aspx", false);
        }
        #endregion

        #region 페이징 처리
        protected void FixedGrid1_PageIndexChanged(object sender, BANANA.Web.Controls.FixedGridPageIndexChangedEventArgs e)
        {
            try
            {
                SearchData();
            }
            catch (Exception err)
            {
                BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }

        protected void FixedGrid1_PageSizeChanged(object sender, BANANA.Web.Controls.FixedGridPageSizeChangedEventArgs e)
        {
            try
            {
                SearchData();
            }
            catch (Exception err)
            {
                BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion

	}
}