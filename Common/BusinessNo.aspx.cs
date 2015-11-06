using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Common
{
	/// <summary>
	/// 사업자등록증 코드헬퍼
	/// </summary>
	public partial class BusinessNo : Controllers.BasePage
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
                DataTable _dt			= base.GetDataTable("WSP_BusinessNo_R1"
                    , _txtBUBIN_NO.Text
                    , _txtSAUP_NO.Text
                    , _txtCOMPANY_NM.Text
                    , _txtPRSDNT_NM.Text
                    );

				// 데이터 복호화
				_dt.Decrypt("BUBIN_NO");

                FixedGrid1.DataSource	= _dt;
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

		#region getUrl : Url 반환
		/// <summary>
		/// Url 반환
		/// </summary>
		/// <param name="BUBIN_NO"></param>
		/// <param name="SAUP_NO"></param>
		/// <param name="COMPANY_NM"></param>
		/// <param name="UPTE"></param>
		/// <param name="UPJONG"></param>
		/// <param name="PRSDNT_NM"></param>
		/// <param name="TELNO"></param>
		/// <param name="FAXNO"></param>
		/// <param name="EMAIL"></param>
		/// <param name="COMPANY_TYPE"></param>
		/// <param name="ADDR"></param>
		/// <returns></returns>
		protected string getUrl(object BUBIN_NO, object SAUP_NO, object COMPANY_NM, object UPTE, object UPJONG, object PRSDNT_NM, object TELNO, object FAXNO, object EMAIL, object COMPANY_TYPE, object ADDR)
		{
			return string.Format("javascript:returnBusinessNo('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}');"
				, BUBIN_NO.ToString()
				, SAUP_NO.ToString()
				, COMPANY_NM.ToString()
				, UPTE.ToString()
				, UPJONG.ToString()
				, PRSDNT_NM.ToString()
				, TELNO.ToString()
				, FAXNO.ToString()
				, EMAIL.ToString()
				, COMPANY_TYPE.ToString()
				, ADDR.ToString()
				);
		}
		#endregion
	}
}