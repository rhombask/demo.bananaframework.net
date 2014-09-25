using System;
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
	}
}