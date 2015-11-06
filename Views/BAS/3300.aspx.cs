using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BANANA.Web.Controls;

namespace demo.bananaframework.net.Views.BAS
{
    /// <summary>
    /// 설  명: 기준정보관리 이용자관리 권한그룹별권한관리 화면
    /// </summary>
    public partial class _3300 : Controllers.BasePage
	{
        #region Page_Init : 페이지 생성전 객체 생성(동적 그리드 생성)
        /// <summary>
        /// 페이지 생성전 객체 생성(동적 그리드 생성)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Init(object sender, EventArgs e)
        {
            DataTable _dt = base.GetDataTable(
                "WSP_BAS3300_R2"
                , _hdCODE.Value
                );

            BANANA.Web.Controls.TemplateField tField = null;

            for (int i = 2; i < _dt.Columns.Count; i++)
            {
                tField						= new BANANA.Web.Controls.TemplateField();
                tField.ItemTemplate			= new GridViewCheckBoxTemplate(_dt.Columns[i].ColumnName);
                tField.ID					= _dt.Columns[i].ColumnName;
                tField.HeaderText			= _dt.Columns[i].ColumnName;
                tField.HeaderTemplate		= new GridViewHeaderCheckBoxTemplate(_dt.Columns[i].ColumnName);
				tField.HorizontalAlignment	= HorizontalAlignment.Center;
                tField.Width				= Unit.Parse("100px");
                this.FixedGrid2.Columns.Add(tField);
            }
        }
        #endregion

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
                SearchData();
            }
        }
        #endregion

        #region SearchData : 데이터 검색
        /// <summary>
        /// 데이터 검색
        /// </summary>
        void SearchData()
        {
            try
            {
                DataTable _dt = base.GetDataTable("WSP_BAS3300_R1"
					, _txtGRP_NM.Text
                    );
                FixedGrid1.DataSource = _dt;
                FixedGrid1.DataBind();
            }
            catch (Exception err)
            {
                BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion

        #region 페이징 처리
        protected void FixedGrid1_PageIndexChanged(object sender, BANANA.Web.Controls.FixedGridPageIndexChangedEventArgs e)
        {
            try
            {
                SearchData();
            }
            catch (Exception err)
            {
                BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }

        protected void FixedGrid1_PageSizeChanged(object sender, BANANA.Web.Controls.FixedGridPageSizeChangedEventArgs e)
        {
            try
            {
                SearchData();
            }
            catch (Exception err)
            {
                BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion

        #region FixedGrid1_ItemCommand : 메인코드 클릭 이벤트
        /// <summary>
        /// 메인코드 클릭 이벤트
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void FixedGrid1_ItemCommand(object sender, BANANA.Web.Controls.FixedGridItemCommandEventArgs e)
        {
            try
            {
                _hdCODE.Value = e.CommandArgument.ToString();

                SetFixedGrid2();
            }
            catch (Exception err)
            {
                BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion

        #region SetFixedGrid2 : 상세 그리드에 데이터 바인딩
        /// <summary>
        /// 상세 그리드에 데이터 바인딩
        /// </summary>
        private void SetFixedGrid2()
        {
            try
            {
                if (!string.IsNullOrEmpty(_hdCODE.Value))
                {
                    _btnSearch.Enabled = true;
                    _btnSave.Enabled = true;

                    DataTable _dt = base.GetDataTable(
                        "WSP_BAS3300_R2"
                        , _hdCODE.Value
                        );

                    FixedGrid2.DataSource = _dt;
                    FixedGrid2.DataBind();
                }
            }
            catch (Exception ex)
            {
                BANANA.Web.NotificationBar.Show(ex.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion

        #region _btnSave_Click : 수정 버튼 클릭 이벤트
        /// <summary>
        /// 수정 버튼 클릭 이벤트
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void _btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 1; i < FixedGrid2.Rows.Count; i++)
                {
                    string _strPRG_ID = FixedGrid2.Rows[i].Cells[1].Value.ToString().Trim(); // 프로그램ID

                    for (int j = 2; j < FixedGrid2.Columns.Count; j++)
                    {
                        if (FixedGrid2.Columns[j].GetType().ToString() == "BANANA.Web.Controls.TemplateField")
                        {
                            BANANA.Web.Controls.CheckBox _cb = (BANANA.Web.Controls.CheckBox)FixedGrid2.Rows[i].Cells[j + 1].FindControl(FixedGrid2.Columns[j].HeaderText);

                            base.ExecuteNonQuery(
                                "WSP_BAS3300_U1"
                                , _strPRG_ID                                // 프로그램ID
                                , _hdCODE.Value                             // 사용자그룹코드
                                , FixedGrid2.Columns[j].HeaderText          // 유저 버튼 명
                                , _cb.Checked                               // 버튼 사용 유무
                                , string.Empty                              // 비고
                                , base.GetCookie("UserID")                  // 시스템수정자ID
                                , base.GetCookie("UserName")                // 시스템수정자명
                                );
                        }
                    }
                }
                BANANA.Web.NotificationBar.Show("수정되었습니다.", BANANA.Web.NotificationBar.NotificationType.Info);
                SetFixedGrid2();
            }
            catch (Exception ex)
            {
                BANANA.Web.NotificationBar.Show(ex.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion

        #region _btnSearch_Click : 검색 버튼 클릭 이벤트
        /// <summary>
        /// 검색 버튼 클릭 이벤트
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void _btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                SearchData();
            }
            catch (Exception ex)
            {
                BANANA.Web.NotificationBar.Show(ex.Message, BANANA.Web.NotificationBar.NotificationType.Error);
            }
        }
        #endregion
	}

    #region GridViewCheckBoxTemplate : 동적 그리드에 바이딩 될 CheckBox
    /// <summary>
    /// 동적 그리드에 바이딩 될 CheckBox
    /// </summary>
    public class GridViewCheckBoxTemplate : ITemplate
    {
        // Properties
        private string columnName;

        #region GridViewCheckBoxTemplate : 생성자 함수
        /// <summary>
        /// 생성자 함수
        /// </summary>
        /// <param name="colname">컬럼명</param>
        public GridViewCheckBoxTemplate(string colname)
        {
            //templateType = type;
            columnName = colname;
        }
        #endregion

        #region InstantiateIn : 초기화 함수
        /// <summary>
        /// 초기화 함수
        /// </summary>
        /// <param name="container"></param>
        public void InstantiateIn(System.Web.UI.Control container)
        {
            BANANA.Web.Controls.CheckBox _cbData = new BANANA.Web.Controls.CheckBox();
            _cbData.ID = columnName;
            _cbData.DataBinding += new EventHandler(_cbData_DataBinding);
            container.Controls.Add(_cbData);
        }
        #endregion

        #region _cbData_DataBinding : 데이터 바인딩 이벤트 핸들러
        /// <summary>
        /// 데이터 바인딩 이벤트 핸들러
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void _cbData_DataBinding(object sender, EventArgs e)
        {
            BANANA.Web.Controls.CheckBox _cbData = (BANANA.Web.Controls.CheckBox)sender;
            BANANA.Web.Controls.TableRow row = (BANANA.Web.Controls.TableRow)_cbData.NamingContainer;
            _cbData.Checked = DataBinder.Eval(row.DataItem, columnName).ToString() == "1" ? true : false;
            _cbData.ToggleGroup = columnName;
        }
        #endregion
    }
    #endregion

    #region GridViewHeaderCheckBoxTemplate : 동적 그리드 헤더에 바이딩 될 CheckBox
    /// <summary>
    /// 동적 그리드 헤더에 바이딩 될 CheckBox
    /// </summary>
    public class GridViewHeaderCheckBoxTemplate : ITemplate
    {
        // Properties
        private string columnName;

        #region GridViewHeaderCheckBoxTemplate : 생성자 함수
        /// <summary>
        /// 생성자 함수
        /// </summary>
        /// <param name="colname">컬럼명</param>
        public GridViewHeaderCheckBoxTemplate(string colname)
        {
            //templateType = type;
            columnName = colname;
        }
        #endregion

        #region InstantiateIn : 초기화 함수
        /// <summary>
        /// 초기화 함수
        /// </summary>
        /// <param name="container"></param>
        public void InstantiateIn(System.Web.UI.Control container)
        {
            BANANA.Web.Controls.CheckBox _cbData	= new BANANA.Web.Controls.CheckBox();
            _cbData.ID								= columnName;
			_cbData.Checked							= true;
            _cbData.DataBinding						+= new EventHandler(_cbData_DataBinding);
            container.Controls.Add(_cbData);
        }
        #endregion

        #region _cbData_DataBinding : 데이터 바인딩 이벤트 핸들러
        /// <summary>
        /// 데이터 바인딩 이벤트 핸들러
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void _cbData_DataBinding(object sender, EventArgs e)
        {
            BANANA.Web.Controls.CheckBox _cbData	= (BANANA.Web.Controls.CheckBox)sender;
            _cbData.IsToggleHeader					= true;
            _cbData.ToggleGroup						= columnName;
            _cbData.Text							= columnName;
        }
        #endregion
    }
    #endregion

}