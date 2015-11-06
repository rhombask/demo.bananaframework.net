using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.Views.CNT
{
	/// <summary>
	/// 대리점 등록/수정
	/// </summary>
	public partial class _2010 : Controllers.BasePage
	{
		#region Page_Load : 페이지 로드
		/// <summary>
		/// 페이지 로드
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				if (!IsPostBack)
				{
					/*
					 * 아래 함수는 RadioButtonList, DropDownList 및 CheckBoxList 컨트롤의 공용 함수입니다.
					 * 기본적으로 CHP_AJAX_CODEHELPER 프로시저를 호출합니다.
					 * 활용 방법은 http://doc.bananaframework.net/Views/BANANA-Web/SetListItem.aspx 를 참고 하세요.
					 */
					base.SetListItem(_ddlBK_CD, "Common", "A10", true);
					base.SetListItem(_ddlCOMPANY_TYPE_CD, "Common", "A14", true);

					_hfCNT_CD.Value		= base.GetQueryString("CNT_CD");
					if (_hfCNT_CD.Value != "")
					{
						// 조회 및 수정
						ViewData();
					}
					else
					{
						// 신규 등록
						_dpREGDT.Date		= System.DateTime.Now.ToString("yyyy-MM-dd");
					}
				}
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion

		#region ViewData : 데이터 상세보기
		/// <summary>
		/// 데이터 상세보기
		/// </summary>
		void ViewData()
		{
			try
			{
				DataTable _dt		= base.GetDataTable("WSP_CNT2010_R1"
					, _hfCNT_CD.Value
					);

				_txtCNT_CD.Text						= _hfCNT_CD.Value;
				_txtCNT_CD.ReadOnly					= true;

				_txtCNT_NM.Text						= _dt.Rows[0]["CNT_NM"].ToString();
				_dpREGDT.Date						= _dt.Rows[0]["REGDT"].ToString();
				_txtCNT_ID.Text						= _dt.Rows[0]["CNT_ID"].ToString();
				_txtPWD.Text						= base.GetDecryptTripleDES(_dt.Rows[0]["PWD"].ToString());
				_chPRNT_CNT_CD.TotalCode			= _dt.Rows[0]["PRNT_CNT_CD"].ToString();
				_chPRNT_CNT_CD.CodeName				= _dt.Rows[0]["PRNT_CNT_NM"].ToString();
				_dpCNCDT.Date						= _dt.Rows[0]["CNCDT"].ToString();
				_txtPRSDNT_NM1.Text					= _dt.Rows[0]["PRSDNT_NM1"].ToString();
				_txtPRSDNT_JUMIN_NO.Text			= base.GetDecryptTripleDES(_dt.Rows[0]["PRSDNT_JUMIN_NO"].ToString());
				_txtPRSDNT_HPNO.Text				= base.GetDecryptTripleDES(_dt.Rows[0]["PRSDNT_HPNO"].ToString());
				_txtPRSDNT_EMAIL.Text				= base.GetDecryptTripleDES(_dt.Rows[0]["PRSDNT_EMAIL"].ToString());
				_txtPRSDNT_ADDR.Text				= base.GetDecryptTripleDES(_dt.Rows[0]["PRSDNT_ADDR"].ToString());
				_ddlBK_CD.SelectedValue				= _dt.Rows[0]["BK_CD"].ToString();
				_txtBK_ACCT_NO.Text					= base.GetDecryptTripleDES(_dt.Rows[0]["BK_ACCT_NO"].ToString());
				_txtBK_OWNER.Text					= base.GetDecryptTripleDES(_dt.Rows[0]["BK_OWNER"].ToString());
				_txtMEMO.Text						= _dt.Rows[0]["MEMO"].ToString();
				_chSAUP_NO.TotalCode				= _dt.Rows[0]["COMPANY_NM"].ToString();
				_chSAUP_NO.CodeName					= _dt.Rows[0]["SAUP_NO"].ToString();
				_txtCOMPANY_NM.Text					= _dt.Rows[0]["COMPANY_NM"].ToString();
				_txtBUBIN_NO.Text					= base.GetDecryptTripleDES(_dt.Rows[0]["BUBIN_NO"].ToString());
				_txtPRSDNT_NM2.Text					= _dt.Rows[0]["PRSDNT_NM2"].ToString();
				_txtUPTE.Text						= _dt.Rows[0]["UPTE"].ToString();
				_txtUPJONG.Text						= _dt.Rows[0]["UPJONG"].ToString();
				_txtTELNO.Text						= _dt.Rows[0]["TELNO"].ToString();
				_txtFAXNO.Text						= _dt.Rows[0]["FAXNO"].ToString();
				_txtEMAIL.Text						= _dt.Rows[0]["EMAIL"].ToString();
				_ddlCOMPANY_TYPE_CD.SelectedValue	= _dt.Rows[0]["COMPANY_TYPE_CD"].ToString();
				_txtADDR.Text						= _dt.Rows[0]["ADDR"].ToString();
				_dvSYSINFO.InnerHtml				= _dt.Rows[0]["SYSINFO"].ToString();
			}
			catch
			{
				throw;
			}
		}
		#endregion

		#region ClearControls : 컨트롤 초기화
		/// <summary>
		/// 컨트롤 초기화
		/// </summary>
		void ClearControls()
		{
			_txtCNT_CD.Text					= "";
			_txtCNT_NM.Text					= "";
			_dpREGDT.Date					= System.DateTime.Now.ToString("yyyy-MM-dd");
			_dpCNCDT.Date					= "";
			_txtCNT_ID.Text					= "";
			_txtPWD.Text					= "";
			_txtPRSDNT_NM1.Text				= "";
			_txtPRSDNT_JUMIN_NO.Text		= "";
			_txtPRSDNT_HPNO.Text			= "";
			_txtPRSDNT_EMAIL.Text			= "";
			_txtPRSDNT_ADDR.Text			= "";
			_ddlBK_CD.SelectedIndex			= 0;
			_txtBK_ACCT_NO.Text				= "";
			_txtBK_OWNER.Text				= "";
			_txtMEMO.Text					= "";
			_txtSAUP_NO.Text				= "";
			_chSAUP_NO.TotalCode			= "";
			_chSAUP_NO.CodeName			= "";
			_txtBUBIN_NO.Text				= "";
			_txtCOMPANY_NM.Text				= "";
			_txtPRSDNT_NM2.Text				= "";
			_txtUPTE.Text					= "";
			_txtUPJONG.Text					= "";
			_txtTELNO.Text					= "";
			_txtFAXNO.Text					= "";
			_txtEMAIL.Text					= "";
			_ddlCOMPANY_TYPE_CD.SelectedIndex	= 0;
			_txtADDR.Text					= "";
		}
		#endregion

		#region _btnSave_Click : 저장 버튼 클릭 이벤트
		/// <summary>
		/// 저장 버튼 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnSave_Click(object sender, EventArgs e)
		{
			try
			{
				/*
				 * 신규 등록과 기존 정보 수정을 분기합니다.
				 * 개인정보 등은 3-DES 암호화를 시켜 줍니다.
				 */
				if (_hfCNT_CD.Value == "")
				{
					base.ExecuteNonQuery("WSP_CNT2010_C1"
						, _txtCNT_CD.Text										// 지사/대리점코드
						, _txtCNT_NM.Text										// 지사/대리점명
						, _dpREGDT.Date											// 등록일자
						, _dpCNCDT.Date											// 해제일자
						, _txtCNT_ID.Text										// 로그인아이디
						, base.GetEncryptTripleDES(_txtPWD.Text)				// 비밀번호(3-DES)
						, GetNullableValue(_chPRNT_CNT_CD)						// 소속지사
						, _txtPRSDNT_NM1.Text									// 대표자명
						, base.GetEncryptTripleDES(_txtPRSDNT_JUMIN_NO.Text)	// 대표자주민번호(3-DES)
						, base.GetEncryptTripleDES(_txtPRSDNT_HPNO.Text)		// 대표자휴대폰(3-DES)
						, base.GetEncryptTripleDES(_txtPRSDNT_EMAIL.Text)		// 대표자이메일(3-DES)
						, base.GetEncryptTripleDES(_txtPRSDNT_ADDR.Text)		// 대표자주소(3-DES)
						, base.GetNullableValue(_ddlBK_CD)						// 은행코드(A10)
						, base.GetEncryptTripleDES(_txtBK_ACCT_NO.Text)			// 계좌번호(3-DES)
						, base.GetEncryptTripleDES(_txtBK_OWNER.Text)			// 예금주(3-DES)
						, _txtMEMO.Text											// 메모
						
						// 사업자등록정보은 코드명에 사업자등록번호를 넣어준다.
						, _chkNew.Checked ? base.GetNullableValue(_txtSAUP_NO) : (_chSAUP_NO.CodeName == "" ? null : _chSAUP_NO.CodeName)
																				// 사업자등록번호
						, base.GetEncryptTripleDES(_txtBUBIN_NO.Text)			// 법인등록번호(3-DES)
						, _txtCOMPANY_NM.Text									// 상호
						, _txtPRSDNT_NM2.Text									// 대표자명
						, _txtUPTE.Text											// 업태
						, _txtUPJONG.Text										// 업종
						, _txtTELNO.Text										// 전화
						, _txtFAXNO.Text										// 팩스
						, _txtEMAIL.Text										// 이메일
						, base.GetNullableValue(_ddlCOMPANY_TYPE_CD)			// 회사형태(A14)
						, _txtADDR.Text											// 주소

						, base.GetCookie("UserID")								// 시스템등록자ID
						, base.GetCookie("UserName")							// 시스템등록자명
						);

					// 컨트롤 초기화
					ClearControls();
					
					BANANA.Web.NotificationBar.Show("새로운 대리점 정보를 등록 하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info);
				}
				else
				{
					base.ExecuteNonQuery("WSP_CNT2010_U1"
						, _txtCNT_CD.Text										// 지사/대리점코드
						, _txtCNT_NM.Text										// 지사/대리점명
						, _dpREGDT.Date											// 등록일자
						, _dpCNCDT.Date											// 해제일자
						, _txtCNT_ID.Text										// 로그인아이디
						, base.GetEncryptTripleDES(_txtPWD.Text)				// 비밀번호(3-DES)
						, GetNullableValue(_chPRNT_CNT_CD)						// 소속지사
						, _txtPRSDNT_NM1.Text									// 대표자명
						, base.GetEncryptTripleDES(_txtPRSDNT_JUMIN_NO.Text)	// 대표자주민번호(3-DES)
						, base.GetEncryptTripleDES(_txtPRSDNT_HPNO.Text)		// 대표자휴대폰(3-DES)
						, base.GetEncryptTripleDES(_txtPRSDNT_EMAIL.Text)		// 대표자이메일(3-DES)
						, base.GetEncryptTripleDES(_txtPRSDNT_ADDR.Text)		// 대표자주소(3-DES)
						, base.GetNullableValue(_ddlBK_CD)						// 은행코드(A10)
						, base.GetEncryptTripleDES(_txtBK_ACCT_NO.Text)			// 계좌번호(3-DES)
						, base.GetEncryptTripleDES(_txtBK_OWNER.Text)			// 예금주(3-DES)
						, _txtMEMO.Text											// 메모

						// 사업자등록정보은 코드명에 사업자등록번호를 넣어준다.
						, _chkNew.Checked ? base.GetNullableValue(_txtSAUP_NO) : (_chSAUP_NO.CodeName == "" ? null : _chSAUP_NO.CodeName)
																				// 사업자등록번호
						, base.GetEncryptTripleDES(_txtBUBIN_NO.Text)			// 법인등록번호(3-DES)
						, _txtCOMPANY_NM.Text									// 상호
						, _txtPRSDNT_NM2.Text									// 대표자명
						, _txtUPTE.Text											// 업태
						, _txtUPJONG.Text										// 업종
						, _txtTELNO.Text										// 전화
						, _txtFAXNO.Text										// 팩스
						, _txtEMAIL.Text										// 이메일
						, base.GetNullableValue(_ddlCOMPANY_TYPE_CD)			// 회사형태(A14)
						, _txtADDR.Text											// 주소

						, base.GetCookie("UserID")								// 시스템수정자ID
						, base.GetCookie("UserName")							// 시스템수정자명
						);

					BANANA.Web.NotificationBar.Show("대리점 정보를 수정 하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info);
				}
			}
			catch (Exception err)
			{
				BANANA.Web.NotificationBar.Show(err.Message, BANANA.Web.NotificationBar.NotificationType.Error);
			}
		}
		#endregion
	}
}