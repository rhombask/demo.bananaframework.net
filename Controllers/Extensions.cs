using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace demo.bananaframework.net
{
	public static class Extensions
	{
		#region ReplaceCaseInsensative : 대소문자 구분없이 문자열 변환
		/// <summary>
		/// 대소문자 구분없이 문자열 변환
		/// </summary>
		/// <param name="s"></param>
		/// <param name="oldValue"></param>
		/// <param name="newValue"></param>
		/// <returns></returns>
		public static string ReplaceCaseInsensative(this string s, string oldValue, string newValue)
		{
			var sb		= new StringBuilder(s);
			int offset	= oldValue.Length - newValue.Length;
			int matchNo = 0;
			foreach (Match match in Regex.Matches(s, Regex.Escape(oldValue), RegexOptions.IgnoreCase))
			{
				sb.Remove(match.Index - (offset * matchNo), match.Length).Insert(match.Index - (offset * matchNo), newValue);
				matchNo++;
			}
			return sb.ToString();
		}
		#endregion

		#region Decrypt : 데이터테이블 내용을 복호화 처리
		/// <summary>
		/// 데이터테이블 내용을 복호화 처리
		/// </summary>
		/// <param name="d"></param>
		/// <param name="ColumnName"></param>
		/// <returns></returns>
		public static DataTable Decrypt(this DataTable d, params string[] ColumnName)
		{
			try
			{
				Controllers.BasePage _bp	= new Controllers.BasePage();
				for (int i = 0; i < d.Rows.Count; i++)
				{
					for (int j = 0; j < d.Columns.Count; j++)
					{
						if (Array.IndexOf(ColumnName, d.Columns[j].ColumnName) > -1)
						{
							d.Rows[i][j]	= _bp.GetDecryptTripleDES(d.Rows[i][j].ToString());
						}
					}
				}
			}
			catch
			{
				throw;
			}

			return d;
		}
		#endregion
	}
}