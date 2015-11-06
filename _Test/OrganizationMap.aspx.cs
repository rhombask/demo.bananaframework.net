using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OrganizationChart;

namespace demo.bananaframework.net._Test
{
	public partial class OrganizationMap : Controllers.BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                this.orgDiagram.Items.Clear();

				DataTable _dt	= base.GetDataTable("__TEST");

				Item root		= new CustomItem(_dt.Rows[0]["MBR_NM"].ToString()
					, _dt.Rows[0]["MBR_CD"].ToString()
					, ""
					, "/Images/Letters/a.png"
					, "등록 : " + _dt.Rows[0]["REGDT"].ToString()
					, string.Format("추천 : {0}({1})", _dt.Rows[0]["REC_NM"].ToString(), _dt.Rows[0]["REC_CD"].ToString())
					, string.Format("후원 : {0}({1})", _dt.Rows[0]["SUP_NM"].ToString(), _dt.Rows[0]["SUP_CD"].ToString())
					);
				root.TemplateName	= "UserTemplateContact";
				root.GroupTitle		= _dt.Rows[0]["JIKUP_NM"].ToString();
				this.orgDiagram.Items.Add(root);

				for (int i = 1; i < _dt.Rows.Count; i++)
				{
					// 자식 선언
					Item child		= new CustomItem(_dt.Rows[i]["MBR_NM"].ToString()
						, _dt.Rows[i]["MBR_CD"].ToString()
						, ""
						, "/Images/Letters/a.png"
						, "등록 : " + _dt.Rows[i]["REGDT"].ToString()
						, string.Format("추천 : {0}({1})", _dt.Rows[i]["REC_NM"].ToString(), _dt.Rows[i]["REC_CD"].ToString())
						, string.Format("후원 : {0}({1})", _dt.Rows[i]["SUP_NM"].ToString(), _dt.Rows[i]["SUP_CD"].ToString())
						);
					child.TemplateName	= "UserTemplateContact";
					child.GroupTitle	= _dt.Rows[i]["JIKUP_NM"].ToString();

					// 부모 선언
					var parent	= this.orgDiagram.Items
						.GetValues()
						.Flatten(myObject => myObject.Items.GetValues())
						.Where(t => t.Value == _dt.Rows[i]["REC_CD"].ToString())
						.ToList<Item>();

					if (parent.Count == 0)
					{
						throw new ArgumentException("부모 계정이 존재하지 않습니다.");
					}

					parent[0].Items.Add(child);
				}

				root.Selected	= true;
            }
		}
	}
	
    [Serializable]
    public class CustomItem : Item
    {
        private string m_regdt;
        private string m_recommend;
        private string m_support;

        #region Constructor

        public CustomItem()
            : base()
        {
        }

        public CustomItem(string title, string value, string description, string imageUrl, string regdt, string recommend, string support)
            : base(title, value, description, imageUrl)
        {
            this.m_regdt		= regdt;
            this.m_recommend	= recommend;
            this.m_support		= support;
        }

        public string RegDate
        {
            get
            {
                return m_regdt;
            }
            set
            {
                this.m_regdt = value;
            }
        }

        public string Recommend
        {
            get
            {
                return m_recommend;
            }
            set 
            {
                this.m_recommend = value;
            }
        }

        public string Support
        {
            get
            {
                return m_support;
            }
            set
            {
                this.m_support = value;
            }
        }

        #endregion //COntructor
    }
}