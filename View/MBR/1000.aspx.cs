using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BANANA.Web;

namespace demo.bananaframework.net.View.MBR
{
	/// <summary>
	/// 회원정보관리
	/// </summary>
	public partial class _1000 : Control.BasePage
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
				// 페이지가 로드되면, 데이터를 검색합니다.
				SearchData();
			}
            catch (Exception ex)
            {
                BANANA.Web.NotificationBar.Show(ex.Message, BANANA.Web.NotificationBar.NotificationType.Error);
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
                DataTable _dt			= base.GetDataTable("WSP_CNT1000_R1"
					, _txtCNT_CD.Text
					, _txtCNT_NM.Text
                    , _txtSAUP_NO.Text
					, _txtPRSDNT_NM.Text
					, _dpSTRT.Date
					, _dpEND.Date
                    );

				/*
				 * 복호화 처리
				 * DB에 암호화 되어서 들어가는 정보는 복호하 처리를 해 주어야 화면에 정상적으로 표기됩니다.
				 * 아래 함수에 복호화 해야하는 DB 필드명들을 전달해 주세요.
				 */
				_dt.Decrypt("PRSDNT_HPNO", "BK_ACCT_NO", "BK_OWNER");

				/*
				 * 대표자휴대폰 필터링
				 * DB에 암호화 되어서 들어가 있는 정보는 DB에서 필터링이 힘듭니다.
				 * 따라서, C#의 데이터 테이블을 필터링 합니다.
				 */
				string query			= string.Format("PRSDNT_HPNO LIKE '%{0}%'", _txtPRSDNT_HPNO.Text);
				_dt						= base.FilterTable(_dt, query);

                FixedGrid1.DataSource	= _dt;
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

		#region FixedGrid1_ExcelClicked : 엑셀로 내보내기 버튼 클릭 이벤트
		/// <summary>
		/// 엑셀로 내보내기 버튼 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
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
		#endregion
	}
}