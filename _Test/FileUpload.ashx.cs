using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace demo.bananaframework.net._Test
{
	/// <summary>
	/// FileUpload1의 요약 설명입니다.
	/// </summary>
	public class FileUpload1 : IHttpHandler
	{

		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "text/plain";
			context.Response.Write("Hello World");
		}

		public bool IsReusable
		{
			get
			{
				return false;
			}
		}
	}
}