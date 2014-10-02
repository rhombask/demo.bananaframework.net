using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.View.BAS
{
	/// <summary>
	/// 제  목: 공통코드관리
	/// 설  명: 
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
				SearchData("$");
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion

		#region SearchData : 데이터 검색
		/// <summary>
		/// 데이터 검색
		/// </summary>
		void SearchData(string MainCode)
		{
			try
			{
				DataSet _ds			= base.GetDataSet("WSP_BAS1000_R1"
					, _txtCODE_NAME1.Text
					, _txtCODE_NAME2.Text
					, MainCode
					);

				FixedGrid1.DataSource	= _ds.Tables[0];
				FixedGrid1.DataBind();

				FixedGrid2.DataSource	= _ds.Tables[1];
				FixedGrid2.DataBind();
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
				SearchData("$");
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion

		#region _btnNew1_Click : 신규(메인코드) 버튼 클릭 이벤트
		/// <summary>
		/// 신규(메인코드) 버튼 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnNew1_Click(object sender, EventArgs e)
		{
			Response.Redirect("/View/BAS/1010.aspx", false);
		}
		#endregion

		#region _btnNew2_Click : 신규(공통코드) 버튼 클릭 이벤트
		/// <summary>
		/// 신규(공통코드) 버튼 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnNew2_Click(object sender, EventArgs e)
		{
			Response.Redirect("/View/BAS/1020.aspx?MAIN_CODE=" + ViewState["MainCode"].ToString(), false);
		}
		#endregion

		#region 페이징 처리
		protected void FixedGrid1_PageIndexChanged(object sender, BANANA.Web.Controls.FixedGridPageIndexChangedEventArgs e)
		{
			try
			{
				SearchData("$");
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
				SearchData("$");
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion

		#region FixedGrid1_ItemCommand : 메인코드 클릭 이벤트
		/// <summary>
		/// 메인코드 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void FixedGrid1_ItemCommand(object sender, BANANA.Web.Controls.FixedGridItemCommandEventArgs e)
		{
			try
			{
				ViewState["MainCode"]	= e.CommandArgument.ToString();
				SearchData(e.CommandArgument.ToString());

				_btnNew2.Enabled		= true;
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion
	}
}