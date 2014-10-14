using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace demo.bananaframework.net.Control.Xenon
{
	public partial class TopMenu : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			_ltMenu.Text	= LoadMenu();
		}

		#region LoadMenu : Xml 메뉴 로드
		/// <summary>
		/// Xml 메뉴 로드
		/// </summary>
		string LoadMenu()
		{
			string _retValue	= string.Empty;

			#region Xml 메뉴를 담기
			string xmlFile	= Server.MapPath("menu.xml");
			XDocument doc	= XDocument.Load(xmlFile);

			/*
			 * 3단 메뉴까지 돌아간다.
			 * 더 많은 단계의 메뉴가 있으면, SubMenus를 추가하도록...
			 */
			var menus		= doc.Root.Elements().Select(e1 =>
				new Menu
				{
					Text		= e1.Attribute("text").Value,
					NavigateUrl	= e1.Attribute("navigateUrl").Value,
					Icon		= e1.Attribute("icon").Value,
					ItemClass	= e1.Attribute("itemClass") != null ? e1.Attribute("itemClass").Value : "",
					ItemName	= e1.Attribute("itemName") != null ? e1.Attribute("itemName").Value : "",
					SubMenus	= e1.Elements().Select(e2 =>
						new Menu
						{
							Text		= e2.Attribute("text").Value,
							NavigateUrl	= e2.Attribute("navigateUrl").Value,
							Icon		= e2.Attribute("icon") != null ? e2.Attribute("icon").Value : "",
							ItemClass	= e2.Attribute("itemClass") != null ? e2.Attribute("itemClass").Value : "",
							ItemName	= e2.Attribute("itemName") != null ? e2.Attribute("itemName").Value : "",
							SubMenus	= e2.Elements().Select(e3 =>
								new Menu
								{
									Text		= e3.Attribute("text").Value,
									NavigateUrl	= e3.Attribute("navigateUrl").Value,
									Icon		= e3.Attribute("icon") != null ? e3.Attribute("icon").Value : "",
									ItemClass	= e3.Attribute("itemClass") != null ? e3.Attribute("itemClass").Value : "",
									ItemName	= e3.Attribute("itemName") != null ? e3.Attribute("itemName").Value : "",
								}).ToList()
						}).ToList()
				}).ToList();
			#endregion

			#region 메뉴를 루프돌면서 출력하기
			_retValue			+= "<ul class=\"navbar-nav click-to-expand\">" + Environment.NewLine;
			foreach (Menu menu in menus)
			{
				// 대메뉴
				_retValue			+= string.Format("			<li{3}><a href=\"{0}\">{1}<span class=\"title\">{2}</span>{4}</a>"
					, menu.NavigateUrl
					, menu.Icon == "" ? "" : string.Format("<i class=\"{0}\"></i>", menu.Icon)
					, menu.Text
					, IsSubmenuNavigated(menu)	// sub menu가 선택되면, active opened 설정
					, GetMenuItem(menu)			// 메뉴명 옆의 아이콘 설정
					);
				
				// sub menus
				_retValue			+= PrintSubMenus(menu);
				_retValue			+= "			</li>" + Environment.NewLine;
			}
			_retValue			+= "		</ul>";
			#endregion

			return _retValue;
		}
		#endregion

		#region PrintSubMenus : 서브 메뉴 출력
		/// <summary>
		/// 서브 메뉴 출력
		/// recursive
		/// </summary>
		/// <param name="menu"></param>
		/// <returns></returns>
		string PrintSubMenus(Menu menu)
		{
			string _retValue	= string.Empty;

			if ((menu.SubMenus != null) && (menu.SubMenus.Count > 0))
			{
				_retValue	+= Environment.NewLine + "				<ul>" + Environment.NewLine;
				foreach (Menu subMenu in menu.SubMenus)
				{
					if (subMenu.Text == "Various Skins")
					{
					}

					// 중메뉴 이하
					_retValue	+= string.Format("					<li{2}><a href=\"{0}\"><span class=\"title\">{1}</span></a>"
						, subMenu.NavigateUrl
						, subMenu.Text
						, IsSubmenuNavigated(subMenu)
						);

					// sub menus
					_retValue	+= PrintSubMenus(subMenu);

					_retValue	+= "			</li>" + Environment.NewLine;
				}
				_retValue	+= "				</ul>" + Environment.NewLine;
			}

			return _retValue;
		}
		#endregion

		#region IsSubmenuNavigated : active opened 설정
		/// <summary>
		/// active opened 설정
		/// 하위 메뉴가 출력되었으면, 상위 메뉴는 active & opened 클래스 추가
		/// 본인 메뉴가 출력되었으면, active 클래스 추가
		/// </summary>
		/// <param name="menu"></param>
		/// <returns></returns>
		string IsSubmenuNavigated(Menu menu)
		{
			string _retValue	= string.Empty;

			if ((menu.SubMenus == null) || (menu.SubMenus.Count == 0))
			{
				if (menu.NavigateUrl == BANANA.Web.ServerVariables.URL)
				{
					_retValue	= " class=\"active\"";
				}
			}
			else
			{
				foreach (Menu subMenu in menu.SubMenus)
				{
					if (subMenu.NavigateUrl == BANANA.Web.ServerVariables.URL)
					{
						_retValue	= " class=\"active opened\"";
						break;
					}
					else
					{
						_retValue	= IsSubmenuNavigated(subMenu);

						if (_retValue != "")
						{
							break;
						}
					}
				}
			}

			return _retValue;
		}
		#endregion
		
		#region GetMenuItem : 아이템 가져오기
		/// <summary>
		/// 아이템 가져오기
		/// </summary>
		/// <param name="menu"></param>
		/// <returns></returns>
		string GetMenuItem(Menu menu)
		{
			return menu.ItemName != "" ? string.Format("<span class=\"{0}\">{1}</span>", menu.ItemClass, menu.ItemName) : "";
		}
		#endregion
	}
}