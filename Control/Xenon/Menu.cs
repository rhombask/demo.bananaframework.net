using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace demo.bananaframework.net.Control.Xenon
{
	/// <summary>
	/// 메뉴 클래스
	/// </summary>
	public class Menu
	{
		// 메뉴명
		public string Text { get; set; }

		// 경로
		public string NavigateUrl { get; set; }

		// 아이콘(대메뉴 전용)
		public string Icon { get; set; }

		// 아이템 클래스(대메뉴 전용)
		public string ItemClass { get; set; }

		// 아이템 명(대메뉴 전용)
		public string ItemName { get; set; }

		// 서브 메뉴들
		public List<Menu> SubMenus { get; set; }
	}
}