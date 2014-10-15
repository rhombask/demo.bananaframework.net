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
	public partial class OrganizationMap : Control.BasePage
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

		void CallOrg()
		{
            /* Root */
            Item MarkKornegay = new Item("Mark Kornegay", "1", "GM Enterprise Services Business Development &amp; Partner Group", "/Images/Letters/a.png");
            MarkKornegay.TemplateName = "UserTemplateContact";
            MarkKornegay.TitleColor = Color.Red;
            MarkKornegay.GroupTitle = "Group";
            MarkKornegay.GroupTitleColor = Color.Green;
            this.orgDiagram.Items.Add(MarkKornegay);

            /* Right Adviser & its team */
            Item BrianSelby = new Item("Brian Selby", "2", "VP, Global Accounts", "/Images/Letters/b.png");
            BrianSelby.TitleColor = Color.Orange;
            BrianSelby.ItemType = ItemType.Adviser;
            BrianSelby.GroupTitle = "Adviser";
            BrianSelby.ShowCheckBox = OrganizationChart.Enabled.False;
			//BrianSelby.ChildrenPlacementType = ChildrenPlacementType.Horizontal;
            MarkKornegay.Items.Add(BrianSelby);

            Item JoanneHarrell = new Item("Joanne Harrell", "3", "VP, Specialist Sales", "/Images/Letters/c.png");
			//JoanneHarrell.ShowCheckBox = OrganizationChart.Enabled.True;
            JoanneHarrell.ShowButtons = OrganizationChart.Enabled.False;
            BrianSelby.Items.Add(JoanneHarrell);

            Item MarkHill = new Item("Mark Hill", "4", "GM, Worldwide Industry Strategy", "/Images/Letters/d.png");
            BrianSelby.Items.Add(MarkHill);

            /* Left Adviser */
            Item OrlandoAyala = new CustomItem("Orlando Ayala", "5", "VP &amp; Deputy General Counsel, Global Corporate Affairs", "/Images/Letters/z.png", "(647) 222-22-2", "1000 Younge St", "info@mail.com");
            OrlandoAyala.TemplateName = "UserTemplateContact";
            OrlandoAyala.Checked = true;
            OrlandoAyala.GroupTitle = "Adviser";
            OrlandoAyala.AdviserPlacementType = AdviserPlacementType.Left;
            OrlandoAyala.ShowCheckBox = OrganizationChart.Enabled.False;
            OrlandoAyala.ItemType = ItemType.Adviser;
            MarkKornegay.Items.Add(OrlandoAyala);

            /* Assistant */
            Item LaneSorgen = new CustomItem("Lane Sorgen", "6", "GM, Enterprise, New York/New Jersey", "/Images/Letters/y.png", "(647) 111-11-11", "79 Wellington St W", "support@mail.com");
            LaneSorgen.TemplateName = "UserTemplateContact";
            LaneSorgen.GroupTitle = "Assistant";
            LaneSorgen.AdviserPlacementType = AdviserPlacementType.Left;
            LaneSorgen.ShowCheckBox = OrganizationChart.Enabled.False;
            LaneSorgen.ItemType = ItemType.SubAssistant;
            MarkKornegay.Items.Add(LaneSorgen);

            /* Group of regular items without teams on the left side of invisible aggregator */
            for (int index = 0; index < 3; index++)
            {
                Item IndexedItem = new Item("Left #" + index.ToString(), index.ToString(), "Description", "/Images/Letters/l.png");
                MarkKornegay.Items.Add(IndexedItem);
            }

            /* Invisible Aggregator */
            Item Aggregator = new Item("Invisible Aggregator", "61");
            Aggregator.ItemType = ItemType.Regular;
            Aggregator.IsVisible = false;
            MarkKornegay.Items.Add(Aggregator);

            /* Group of regular items without teams on the right side of invisible aggregator */
            for (int index = 0; index < 3; index++)
            {
                Item IndexedItem = new Item("Right #" + index.ToString(), index.ToString(), "Description", "/Images/Letters/r.png");
                MarkKornegay.Items.Add(IndexedItem);
            }

            /* Robert Deshaies Team */
            Item RobertDeshaies = new Item("Robert Deshaies", "7", "SMS&amp;P, Pacific Northwest", "/Images/Letters/x.png");
            RobertDeshaies.TitleColor = Color.FromArgb(0x33, 0x33, 0x65);
            Aggregator.Items.Add(RobertDeshaies);
            for (int index = 0; index < 10; index++)
            {
                Item IndexedItem = new Item("#" + index.ToString(), index.ToString(), "Description", "/Images/Letters/q.png");
                RobertDeshaies.Items.Add(IndexedItem);
            }

            /* Mike Sidoroff Team */
            Item MikeSidoroff = new Item("Mike Sidoroff", "7", "SMS&amp;P, Northeast", "/Images/Letters/y.png");
            MikeSidoroff.TitleColor = Color.FromArgb(0x33, 0x33, 0x65);
            Aggregator.Items.Add(MikeSidoroff);
            for (int index = 0; index < 12; index++)
            {
                Item IndexedItem = new Item("#" + index.ToString(), index.ToString(), "Description", "/Images/Letters/p.png");
                MikeSidoroff.Items.Add(IndexedItem);
            }

            /* David Canon Team */
            Item DavidCanon = new Item("David Canon", "7", "SMS&amp;P, North", "/Images/Letters/y.png");
            DavidCanon.TitleColor = Color.FromArgb(0x33, 0x33, 0x65);
            Aggregator.Items.Add(DavidCanon);
            for (int index = 0; index < 8; index++)
            {
                Item IndexedItem = new Item("#" + index.ToString(), index.ToString(), "Description", "/Images/Letters/t.png");
                DavidCanon.Items.Add(IndexedItem);
            }

			//MarkKornegay.Selected = true;
			//JoanneHarrell.Checked = true;
			//RobertDeshaies.Checked = true;
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
            this.m_regdt = regdt;
            this.m_recommend = recommend;
            this.m_support = support;
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