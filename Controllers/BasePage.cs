using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace demo.bananaframework.net.Controllers
{
	/// <summary>
	/// 프로젝트에서 상속 받을 기본 페이지 클래스
	/// </summary>
	public class BasePage : BANANA.Web.BasePage
	{
		// Value 반환
		#region GetNullableInteger : Null 가능형 정수 반환
		/// <summary>
		/// Null 가능형 정수 반환
		/// </summary>
		/// <param name="_textBox"></param>
		/// <returns></returns>
		public int? GetNullableInteger(BANANA.Web.Controls.TextBox _textBox)
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

		#region GetNullableDecimal : Null 가능형 소수 반환
		/// <summary>
		/// Null 가능형 소수 반환
		/// </summary>
		/// <param name="_textBox"></param>
		/// <returns></returns>
		public decimal? GetNullableDecimal(BANANA.Web.Controls.TextBox _textBox)
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

		#region GetNullableValue : Null 가능형 값 반환
		/// <summary>
		/// Null 가능형 값 반환
		/// </summary>
		/// <param name="_dropDownList"></param>
		/// <returns></returns>
		public string GetNullableValue(BANANA.Web.Controls.DropDownList _dropDownList)
		{
			if (_dropDownList.SelectedValue == null)
			{
				return null;
			}
			else
			{
				if (_dropDownList.SelectedValue == "")
				{
					return null;
				}
				else
				{
					return _dropDownList.SelectedValue;
				}
			}
		}
		#endregion

		#region GetNullableValue : Null 가능형 값 반환
		/// <summary>
		/// Null 가능형 값 반환
		/// </summary>
		/// <param name="_dropDownList"></param>
		/// <returns></returns>
		public string GetNullableValue(BANANA.Web.Controls.TextBox _textBox)
		{
			if (_textBox.Text == null)
			{
				return null;
			}
			else
			{
				return _textBox.Text;
			}
		}
		#endregion

		#region GetNullableValue : Null 가능형 값 반환
		/// <summary>
		/// Null 가능형 값 반환
		/// </summary>
		/// <param name="_dropDownList"></param>
		/// <returns></returns>
		public string GetNullableValue(BANANA.Web.Controls.CodeHelper _codeHelper)
		{
			if (_codeHelper.TotalCode == "")
			{
				return null;
			}
			else
			{
				return _codeHelper.TotalCode;
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

		#region SerializeTable : 데이터테이블 직력화
		/// <summary>
		/// 데이터테이블 직력화
		/// </summary>
		/// <param name="table"></param>
		/// <returns></returns>
		public static IEnumerable<Dictionary<string, object>> SerializeTable(DataTable table)
		{
			return table.DefaultView.OfType<DataRowView>().Select(row =>
			{
				var result = new Dictionary<string, object>();
				foreach (DataColumn column in table.Columns)
				{
					result.Add(column.ColumnName, row.Row[column.ColumnName]);
				}

				return result;
			});
		}
		#endregion
	}
}