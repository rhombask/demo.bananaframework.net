using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace demo.bananaframework.net.Control
{
	/// <summary>
	/// 프로젝트에서 상속 받을 기본 페이지 클래스
	/// </summary>
	public class BasePage : BANANA.Web.BasePage
	{
		// Value 반환
		#region GetInteger : 정수형 반환
		/// <summary>
		/// 정수형 반환
		/// </summary>
		/// <param name="_textBox"></param>
		/// <returns></returns>
		public int? GetInteger(BANANA.Web.Controls.TextBox _textBox)
		{
			if (_textBox.Text.Trim() == "")
			{
				return null;
			}
			else
			{
				return Convert.ToInt32(_textBox.Text.Trim());
			}
		}
		#endregion

		#region GetDecimal : 소수형 반환
		/// <summary>
		/// 소수형 반환
		/// </summary>
		/// <param name="_textBox"></param>
		/// <returns></returns>
		public decimal? GetDecimal(BANANA.Web.Controls.TextBox _textBox)
		{
			if (_textBox.Text.Trim() == "")
			{
				return null;
			}
			else
			{
				return Convert.ToDecimal(_textBox.Text.Trim());
			}
		}
		#endregion

		#region GetEncryptionData : JavaScript에서 사용할 암호화 함수
		/// <summary>
		/// JavaScript에서 사용할 암호화 함수
		/// </summary>
		/// <param name="PlainText">평문</param>
		/// <returns></returns>
		[Ajax.AjaxMethod()]
		public string[] GetEncryptionData(string PlainText)
		{
			string[] _retValue = new string[2];
			_retValue[0] = "OK";
			_retValue[1] = "";

			try
			{
				_retValue[1]	= base.GetEncryptTripleDES(PlainText);
			}
			catch (Exception err)
			{
				_retValue[0] = "ERROR";
				_retValue[1] = err.Message;
			}

			return _retValue;
		}
		#endregion
	}
}