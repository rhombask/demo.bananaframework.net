using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BANANA.Web;

namespace demo.bananaframework.net.View.CNT
{
	/// <summary>
	/// 지사정보관리
	/// </summary>
	public partial class _1000 : Control.BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		

        #region SearchData : 데이터 검색
        /// <summary>
        /// 데이터 검색
        /// </summary>
        void SearchData()
        {
            try
            {
                DataTable _dt = base.GetDataTable("WSP_MBR1000_R1"
                    , _txtMBR_CD.Text
                    , _txtMBR_NM.Text
                    , _txtCNTR_HPNO.Text
                    , _txtCNTR_NM.Text
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

		protected void FixedGrid1_ExcelClicked(object sender, BANANA.Web.Controls.FixedGridExcelClickedEventArgs e)
		{
			try
			{
				FixedGrid1.ExportToExcel();
			}
			catch (Exception err)
			{
				NotificationBar.Show(err.Message, NotificationBar.NotificationType.Error);
			}
		}
	}
}