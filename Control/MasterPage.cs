using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Control
{
	/// <summary>
	/// 마스터 페이지 클래스
	/// 권한 처리를 합니다.
	/// </summary>
	public class MasterPage : BANANA.Web.MasterPage
	{
        #region PermissionRoll : 버튼별 권한 처리
        /// <summary>
        /// 버튼별 권한 처리
        /// </summary>
        /// <param name="_strPGURL">프로그램경로</param>
        /// <param name="_obj">BANANA Button 컨트롤</param>
        public void PermissionRoll(object _obj)
        {
			BANANA.Web.Controls.Button _cmd = (BANANA.Web.Controls.Button)_obj;

            try
            {
                DataSet _ds = base.GetDataSet("WSP_USERPERMISSION_LOAD"
					, BANANA.Web.ServerVariables.PATH_INFO
                    , base.GetCookie("UserGroupCode")
                );

                // 권한이 설정되지 않은 경우, 첫 페이지로 돌아간다.
                if ((_ds.Tables.Count == 0) || (_ds.Tables[1].Rows.Count == 0))
				{
					string url	= string.Format("/Common/500.aspx?Message={0}", Server.UrlEncode("권한이 설정되어 있지 않은 페이지입니다."));
					Response.Redirect(url, false);
				}
                else
                {
                    for (int i = 0; i < _ds.Tables[0].Rows.Count; i++)
                    {
                        if (string.IsNullOrEmpty(_cmd.CommandName))
                        {
                            if (_cmd.ButtonImage.ToString() == _ds.Tables[0].Rows[i]["AUTH_NAME"].ToString())
                            {
                                if (_ds.Tables[1].Rows[0][_ds.Tables[0].Rows[i]["AUTH_NAME"].ToString()].Equals("1"))
								{
									// 개발자가 화면에서 enabled=false를 주었을 경우에는 변경하지 않는다.
									if (_cmd.Enabled)
									{
										_cmd.Enabled	= true;
									}
								}
                                else
								{
									_cmd.Enabled	= false;
								}
                            }
                        }
                        else
                        {
                            if (_cmd.CommandName == _ds.Tables[0].Rows[i]["AUTH_NAME"].ToString())
                            {
                                if (_ds.Tables[1].Rows[0][_ds.Tables[0].Rows[i]["AUTH_NAME"].ToString()].Equals("1"))
								{
									// 개발자가 화면에서 enabled=false를 주었을 경우에는 변경하지 않는다.
									if (_cmd.Enabled)
									{
										_cmd.Enabled	= true;
									}
								}
                                else
								{
									_cmd.Enabled	= false;
								}
                            }
                        }
                    }
                }
            }
            catch
            {
				// 개발자 실수로 오류가 발생할 경우, 무조건 enabled=false 처리한다.
                _cmd.Enabled	= false;
                throw;
            }
        }
        #endregion

        #region IsContentPlaceHolder : ContentPlaceHolder인지 여부 반환
        /// <summary>
        /// ContentPlaceHolder인지 여부 반환
        /// </summary>
        /// <param name="_obj">Form 내의 컨트롤</param>
        /// <returns>ContentPlaceHolder인지 여부</returns>
        public bool IsContentPlaceHolder(object _obj)
        {
            bool _retValue = false;

            try
            {
                ContentPlaceHolder _c = (ContentPlaceHolder)_obj;
                _retValue = true;
            }
            catch
            {
            }

            return _retValue;
        }
        #endregion

        #region IsHtmlContainerControl : HtmlContainerControl인지 여부 반환
        /// <summary>
        /// HtmlContainerControl인지 여부 반환
        /// </summary>
        /// <param name="_obj">Form 내의 컨트롤</param>
        /// <returns>HtmlContainerControl인지 여부</returns>
        public bool IsHtmlContainerControl(object _obj)
        {
            bool _retValue = false;

            try
            {
                HtmlContainerControl _c = (HtmlContainerControl)_obj;
                _retValue = true;
            }
            catch
            {
            }

            return _retValue;
        }
        #endregion

        #region IsIHCommandButton : IHCommandButton인지 여부 반환
        /// <summary>
        /// IHCommandButton인지 여부 반환
        /// </summary>
        /// <param name="_obj">Form 내의 컨트롤</param>
        /// <returns>BANANA.Web.Controls.Button인지 여부</returns>
        public bool IsBANANAButton(object _obj)
        {
            bool _retValue = false;

            try
            {
                BANANA.Web.Controls.Button _c = (BANANA.Web.Controls.Button)_obj;
                _retValue = true;
            }
            catch
            {
            }

            return _retValue;
        }
        #endregion
	}
}