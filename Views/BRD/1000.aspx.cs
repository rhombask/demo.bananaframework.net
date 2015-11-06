using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Views.BRD
{
	/// <summary>
	/// 제  목: 게시판 목록
	/// 작성자: 손정민(rhombask@gmail.com, 010-2865-4368)
	/// 작성일: 2015-10-05 23:06
	/// 설  명: 
	/// </summary>
	public partial class _1000 : Controllers.BasePage
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
				ViewState["db"]		= base.GetQueryString("db");

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
				DataTable _dt			= base.GetDataTable("WSP_BRD1000_R1"
					, ViewState["db"].ToString()
					);

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
	}
}