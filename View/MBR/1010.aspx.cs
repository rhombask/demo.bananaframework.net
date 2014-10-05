using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.View.MBR
{
	/// <summary>
	/// 회원정보 등록/수정
	/// </summary>
	public partial class _1010 : Control.BasePage
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
					base.SetListItem(_ddlBK_CD, "Common", "A10", true);
					base.SetListItem(_ddlJIKUP_CD, "Common", "A02", true);

					_hfMBR_CD.Value		= base.GetQueryString("MBR_CD");
					if (_hfMBR_CD.Value != "")
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
				DataTable _dt				= base.GetDataTable("WSP_MBR1010_R1"
					, _hfMBR_CD.Value
					);
					
				_txtMBR_CD.Text				= _hfMBR_CD.Value;
				_txtMBR_CD.ReadOnly			= true;
				_chkAUTO.Checked			= false;
				_chkAUTO.Enabled			= false;
				_txtMBR_NM.Text				= _dt.Rows[0]["MBR_NM"].ToString();
				_dpREGDT.Date				= _dt.Rows[0]["REGDT"].ToString();
				_txtMBR_ID.Text				= _dt.Rows[0]["MBR_ID"].ToString();
				_txtPWD.Text				= base.GetDecryptTripleDES(_dt.Rows[0]["PWD"].ToString());
				_dpCNCDT.Date				= _dt.Rows[0]["CNCDT"].ToString();
				_chBRANCH_CD.TotalCode		= _dt.Rows[0]["BRANCH_CD"].ToString();
				_chBRANCH_CD.CodeName		= _dt.Rows[0]["BRANCH_NM"].ToString();
				_chBRANCH_CD.ReadOnly		= true;
				_lblBRANCH_CD.ShowHelp		= true;
				_lblBRANCH_CD.HelpMessage	= "소속지사 변경은 지사/대리점변경 메뉴를 이용하세요.";
				_chAGENT_CD.TotalCode		= _dt.Rows[0]["AGENT_CD"].ToString();
				_chAGENT_CD.CodeName		= _dt.Rows[0]["AGENT_NM"].ToString();
				_chAGENT_CD.ReadOnly		= true;
				_lblAGENT_CD.HelpMessage	= "소속대리점 변경은 지사/대리점변경 메뉴를 이용하세요.";
				_ddlJIKUP_CD.SelectedValue	= _dt.Rows[0]["JIKUP_CD"].ToString();
				_chREC_CD.TotalCode			= _dt.Rows[0]["REC_CD"].ToString();
				_chREC_CD.CodeName			= _dt.Rows[0]["REC_NM"].ToString();
				_chREC_CD.ReadOnly			= true;
				_lblREC_CD.HelpMessage		= "추천회원 변경은 라인이동처리 메뉴를 이용하세요.";
				_chSUP_CD.TotalCode			= _dt.Rows[0]["SUP_CD"].ToString();
				_chSUP_CD.CodeName			= _dt.Rows[0]["SUP_NM"].ToString();
				_chSUP_CD.ReadOnly			= true;
				_lblSUP_CD.HelpMessage		= "후원회원 변경은 라인이동처리 메뉴를 이용하세요.";
				_txtMBR_JUMIN_NO.Text		= base.GetDecryptTripleDES(_dt.Rows[0]["MBR_JUMIN_NO"].ToString());
				_dpMBR_BIRTH_DT.Date		= _dt.Rows[0]["MBR_BIRTH_DT"].ToString();
				_txtMBR_HPNO.Text			= base.GetDecryptTripleDES(_dt.Rows[0]["MBR_HPNO"].ToString());
				_txtMBR_EMAIL.Text			= base.GetDecryptTripleDES(_dt.Rows[0]["MBR_EMAIL"].ToString());
				_txtMBR_ADDR.Text			= base.GetDecryptTripleDES(_dt.Rows[0]["MBR_ADDR"].ToString());
				_ddlBK_CD.SelectedValue		= _dt.Rows[0]["BK_CD"].ToString();
				_txtBK_ACCT_NO.Text			= base.GetDecryptTripleDES(_dt.Rows[0]["BK_ACCT_NO"].ToString());
				_txtBK_OWNER.Text			= base.GetDecryptTripleDES(_dt.Rows[0]["BK_OWNER"].ToString());
				_txtMEMO.Text				= _dt.Rows[0]["MEMO"].ToString();
				_dvSYSINFO.InnerHtml		= _dt.Rows[0]["SYSINFO"].ToString();
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
			_txtMBR_CD.Text				= "";
			_chkAUTO.Checked			= false;
			_txtMBR_NM.Text				= "";
			_dpREGDT.Date				= System.DateTime.Now.ToString("yyyy-MM-dd");
			_txtMBR_ID.Text				= "";
			_txtPWD.Text				= "";
			_dpCNCDT.Date				= "";
			_chBRANCH_CD.TotalCode		= "";
			_chBRANCH_CD.CodeName		= "";
			_chAGENT_CD.TotalCode		= "";
			_chAGENT_CD.CodeName		= "";
			_ddlJIKUP_CD.SelectedIndex	= 0;
			_chREC_CD.TotalCode			= "";
			_chREC_CD.CodeName			= "";
			_chSUP_CD.TotalCode			= "";
			_chSUP_CD.CodeName			= "";
			_txtMBR_JUMIN_NO.Text		= "";
			_dpMBR_BIRTH_DT.Date		= "";
			_txtMBR_HPNO.Text			= "";
			_txtMBR_EMAIL.Text			= "";
			_txtMBR_ADDR.Text			= "";
			_ddlBK_CD.SelectedIndex		= 0;
			_txtBK_ACCT_NO.Text			= "";
			_txtBK_OWNER.Text			= "";
			_txtMEMO.Text				= "";
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
				if (_hfMBR_CD.Value == "")
				{
					base.ExecuteNonQuery("WSP_MBR1010_C1"
						, _txtMBR_CD.Text									// 회원코드
						, _chkAUTO.Checked									// 자동채번여부
						, _txtMBR_NM.Text									// 회원명
						, _txtMBR_ID.Text									// 로그인아이디
						, base.GetEncryptTripleDES(_txtPWD.Text)			// 비밀번호(3-DES)
						, base.GetNullableValue(_chREC_CD)					// 추천회원코드
						, base.GetNullableValue(_chSUP_CD)					// 후원회원코드
						, base.GetNullableValue(_chBRANCH_CD)				// 소속지사코드
						, base.GetNullableValue(_chAGENT_CD)				// 소속대리점코드
						, _dpREGDT.Date										// 등록일자
						, _dpCNCDT.Date										// 해제일자
						, base.GetEncryptTripleDES(_txtMBR_JUMIN_NO.Text)	// 주민등록번호(3-DES)
						, _dpMBR_BIRTH_DT.Date								// 생년월일
						, base.GetEncryptTripleDES(_txtMBR_HPNO.Text)		// 휴대폰(3-DES)
						, base.GetEncryptTripleDES(_txtMBR_EMAIL.Text)		// 이메일(3-DES)
						, base.GetEncryptTripleDES(_txtMBR_ADDR.Text)		// 주소(3-DES)
						, base.GetNullableValue(_ddlJIKUP_CD)				// 직급코드
						, base.GetNullableValue(_ddlBK_CD)					// 은행코드(A10)
						, base.GetEncryptTripleDES(_txtBK_ACCT_NO.Text)		// 계좌번호(3-DES)
						, base.GetEncryptTripleDES(_txtBK_OWNER.Text)		// 예금주(3-DES)
						, _txtMEMO.Text										// 메모
						, base.GetCookie("UserID")							// 시스템등록자ID
						, base.GetCookie("UserName")						// 시스템등록자명
						);

					// 컨트롤 초기화
					ClearControls();
					
					BANANA.Web.NotificationBar.Show("새로운 회원 정보를 등록 하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info);
				}
				else
				{
					base.ExecuteNonQuery("WSP_MBR1010_U1"
						, _txtMBR_CD.Text									// 회원코드
						, _txtMBR_NM.Text									// 회원명
						, _txtMBR_ID.Text									// 로그인아이디
						, base.GetEncryptTripleDES(_txtPWD.Text)			// 비밀번호(3-DES)
						, _dpREGDT.Date										// 등록일자
						, _dpCNCDT.Date										// 해제일자
						, base.GetEncryptTripleDES(_txtMBR_JUMIN_NO.Text)	// 주민등록번호(3-DES)
						, _dpMBR_BIRTH_DT.Date								// 생년월일
						, base.GetEncryptTripleDES(_txtMBR_HPNO.Text)		// 휴대폰(3-DES)
						, base.GetEncryptTripleDES(_txtMBR_EMAIL.Text)		// 이메일(3-DES)
						, base.GetEncryptTripleDES(_txtMBR_ADDR.Text)		// 주소(3-DES)
						, base.GetNullableValue(_ddlJIKUP_CD)				// 직급코드
						, base.GetNullableValue(_ddlBK_CD)					// 은행코드(A10)
						, base.GetEncryptTripleDES(_txtBK_ACCT_NO.Text)		// 계좌번호(3-DES)
						, base.GetEncryptTripleDES(_txtBK_OWNER.Text)		// 예금주(3-DES)
						, _txtMEMO.Text										// 메모
						, base.GetCookie("UserID")							// 시스템수정자ID
						, base.GetCookie("UserName")						// 시스템수정자명
						);

					BANANA.Web.NotificationBar.Show("회원 정보를 수정 하였습니다.", BANANA.Web.NotificationBar.NotificationType.Info);
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