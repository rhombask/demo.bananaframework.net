using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Framework.Common
{
	/// <summary>
	/// 아이프레임을 이용하여, 세로로만 스크롤바가 생기도록 처리
	/// </summary>
	public partial class PopupFrame : System.Web.UI.Page
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
				string _strQueryString = string.Empty;
				foreach (string key in Request.QueryString.AllKeys)
				{
					if (key.ToLower() != "url")
						_strQueryString += "&" + key + "=" + Request.QueryString[key].ToString();
				}

				string _strUrl = Request.QueryString["url"].ToString();
				_ifPOPUP.Attributes.Add("src", _strUrl + _strQueryString);
			}
		}
		#endregion
	}
}