using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Common
{
	/// <summary>
	/// 500 페이지
	/// </summary>
	public partial class _500 : System.Web.UI.Page
	{
		private string physicalUrl	= BANANA.Web.ServerVariables.APPL_PHYSICAL_PATH;

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
				if (!IsPostBack)
				{
					object message	= Request.QueryString["Message"];
					if (message != null)
					{
						Message.InnerHtml	= message.ToString();
						this.Title = message.ToString();
					}
					else
					{
						Exception err = Server.GetLastError();
						if (err != null)
						{
							Exception inner			= err.InnerException;

							// 메시지를 출력한다.
							string errMessage		= err.Message;
							errMessage				+= err.HelpLink != null ? "<br />HelpLink : " + err.HelpLink : "";
							if (inner != null)
							{
								errMessage				+= "<br />&nbsp;&nbsp;&nbsp;&nbsp;InnerException : " + inner.Message;
							}
							Message.InnerHtml		= errMessage.ReplaceCaseInsensative(physicalUrl, "\\").Replace("\\", "/");

							// StackTrace를 출력한다.
							string stackTrace		= err.StackTrace;
							stackTrace				= stackTrace.Replace("\r\n", "<br />");
							if (inner != null)
							{
								string innerStackTrace	= inner.StackTrace;
								innerStackTrace			= innerStackTrace.Replace("\r\n", "<br />&nbsp;&nbsp;&nbsp;&nbsp;");
								stackTrace				+= "<br />&nbsp;&nbsp;&nbsp;&nbsp;InnerException : " + innerStackTrace;
							}
							StackTrace.InnerHtml	= stackTrace.ReplaceCaseInsensative(physicalUrl, "\\").Replace("\\", "/");
						}
					}
				}
			}
			catch
			{
				throw;
			}
		}
		#endregion
	}
}