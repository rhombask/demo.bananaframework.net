using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace demo.bananaframework.net.Controllers
{
	/// <summary>
	/// 로그인 아이디 중복 체크
	/// </summary>
	public class CheckDuplicatedLoginID : IHttpHandler
	{
		#region ProcessRequest : 요청 함수
		/// <summary>
		/// 요청 함수
		/// </summary>
		/// <param name="context"></param>
		public void ProcessRequest(HttpContext context)
		{
			string _retValue		= string.Empty;
			BANANA.Web.BasePage _bp	= new BANANA.Web.BasePage();
			DataTable _dt			= new DataTable();
			_dt.Columns.Add("GUBUN", typeof(string));
			_dt.Columns.Add("Message", typeof(string));
			
			try
			{
				string UserID			= context.Request["UserID"];
				string UserCode			= context.Request["UserCode"];

				DataTable _dtCheck		= _bp.GetDataTable("WSP_USERS_R3"
					, UserID		// 로그인 아이디
					, UserCode		// 이용자코드
					);

				if (_dtCheck.Rows.Count == 0)
				{
					DataRow _dr				= _dt.NewRow();
					_dr["GUBUN"]			= "OK";
					_dr["Message"]			= "정상적으로 신청 되었습니다.";
					_dt.Rows.Add(_dr);
				}
				else
				{
					DataRow _dr				= _dt.NewRow();
					_dr["GUBUN"]			= "ERROR";
					_dr["Message"]			= "입력하신 아이디는 이미 등록되어 있습니다.";
					_dt.Rows.Add(_dr);
				}
			}
			catch (Exception err)
			{
				DataRow _dr				= _dt.NewRow();
				_dr["GUBUN"]			= "ERROR";
				_dr["Message"]			= err.Message;
				_dt.Rows.Add(_dr);
			}
			
			JavaScriptSerializer js	= new JavaScriptSerializer();
			_retValue				= js.Serialize(Controllers.BasePage.SerializeTable(_dt));
			context.Response.ContentType = "application/json";
			context.Response.Write(_retValue);
		}
		#endregion

		#region IsReusable
		/// <summary>
		/// IsReusable
		/// </summary>
		public bool IsReusable
		{
			get { return false; }
		}
		#endregion
	}
}