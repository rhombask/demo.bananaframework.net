using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace demo.bananaframework.net.Control
{
	/// <summary>
	/// Summary description for Login
	/// </summary>
	public class Login : IHttpHandler
	{
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
			_dt.Columns.Add("Url", typeof(string));
			
			try
			{
				string UserID			= context.Request["userID"];
				string PWD				= context.Request["passwd"];

				DataTable _dtLogin		= _bp.GetDataTable("WSP_LOGIN"
					, UserID		// 로그인 아이디
					);

				// 비밀번호 오류
				if (_bp.GetDecryptTripleDES(_dtLogin.Rows[0]["PWD"].ToString()) != PWD)
				{
					DataRow _dr				= _dt.NewRow();
					_dr["GUBUN"]			= "ERROR";
					_dr["Message"]			= "비밀번호가 틀립니다.";
					_dt.Rows.Add(_dr);
				}
				else
				{
					_bp.SetCookie("UserID", UserID);
					_bp.SetCookie("UserName", _dtLogin.Rows[0]["NAME"].ToString());
					_bp.SetCookie("UserGroupName", _dtLogin.Rows[0]["USER_GRP_NM"].ToString());
					_bp.SetCookie("UserGroupCode", _dtLogin.Rows[0]["USER_GRP_CD"].ToString());
					
					DataRow _dr				= _dt.NewRow();
					_dr["GUBUN"]			= "OK";
					_dr["Message"]			= "로그인이 성공하였습니다.";
					_dr["Url"]				= _dtLogin.Rows[0]["URL"].ToString();
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
			_retValue				= js.Serialize(Control.BasePage.SerializeTable(_dt));
			context.Response.ContentType = "application/json";
			context.Response.Write(_retValue);
		}
		
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