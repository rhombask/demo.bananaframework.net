using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo.bananaframework.net.FileUpload
{
	public partial class Demo : Controllers.BasePage
	{
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
				#region Buttons
				base.SetListItem(_rblButtonsShowAdd, this.GetBoolean(), "TOTAL_CODE", "CODE_NAME");
				base.SetListItem(_rblButtonsShowRemoveAllFiles, this.GetBoolean(), "TOTAL_CODE", "CODE_NAME");
				base.SetListItem(_rblButtonsShowRemoveSelectedFiles, this.GetBoolean(), "TOTAL_CODE", "CODE_NAME");
				base.SetListItem(_rblButtonsShowStartUpload, this.GetBoolean(), "TOTAL_CODE", "CODE_NAME");
				
				this.SetBooleanCookieValue(_rblButtonsShowAdd, "_rblButtonsShowAdd");
				this.SetBooleanCookieValue(_rblButtonsShowRemoveAllFiles, "_rblButtonsShowRemoveAllFiles");
				this.SetBooleanCookieValue(_rblButtonsShowRemoveSelectedFiles, "_rblButtonsShowRemoveSelectedFiles");
				this.SetBooleanCookieValue(_rblButtonsShowStartUpload, "_rblButtonsShowStartUpload");
				#endregion

				#region DownloadManager
				base.SetListItem(_rblDownloadManagerEnableCancelButton, this.GetBoolean(), "TOTAL_CODE", "CODE_NAME");
				base.SetListItem(_rblDownloadManagerEnableChangeFolderButton, this.GetBoolean(), "TOTAL_CODE", "CODE_NAME");
				base.SetListItem(_rblDownloadManagerEnableOpenFolderButton, this.GetBoolean(), "TOTAL_CODE", "CODE_NAME");
				base.SetListItem(_ddlDownloadManagerRootFolder, this.GetRootFolder(), "TOTAL_CODE", "CODE_NAME");
				
				this._txtDownloadManagerDefaultFolder.Text		= base.GetCookie("_txtDownloadManagerDefaultFolder");
				this.SetBooleanCookieValue(_rblDownloadManagerEnableCancelButton, "_rblDownloadManagerEnableCancelButton");
				this.SetBooleanCookieValue(_rblDownloadManagerEnableChangeFolderButton, "_rblDownloadManagerEnableChangeFolderButton");
				this.SetBooleanCookieValue(_rblDownloadManagerEnableOpenFolderButton, "_rblDownloadManagerEnableOpenFolderButton");
				this.SetDropDownCookieValue(_ddlDownloadManagerRootFolder, "_ddlDownloadManagerRootFolder");
				#endregion

				#region Limit
				base.SetListItem(_ddlLimitIndividualFileUnit, this.GetFileUnit(), "TOTAL_CODE", "CODE_NAME");
				base.SetListItem(_ddlLimitTotalFilesUnit, this.GetFileUnit(), "TOTAL_CODE", "CODE_NAME");
				
				this._txtLimitIndividualFileLength.Text			= base.GetCookie("_txtLimitIndividualFileLength") == "" ? FileUpload1.Limit.IndividualFileLength.ToString() : base.GetCookie("_txtLimitIndividualFileLength");
				if (base.GetCookie("_ddlLimitIndividualFileUnit") == "")
				{
					_ddlLimitIndividualFileUnit.SelectedValue	= FileUpload1.Limit.IndividualFileUnit.ToString();
				}
				else
				{
					this.SetDropDownCookieValue(_ddlLimitIndividualFileUnit, "_ddlLimitIndividualFileUnit");
				}
				this._txtLimitPermittedExtensions.Text			= base.GetCookie("_txtLimitPermittedExtensions") == "" ? FileUpload1.Limit.PermittedExtensions : base.GetCookie("_txtLimitPermittedExtensions");
				if (base.GetCookie("_txtLimitTotalFilesCount") == "")
				{
					this._txtLimitTotalFilesCount.Text				= FileUpload1.Limit.TotalFilesCount.ToString();
				}
				else
				{
					this._txtLimitTotalFilesCount.Text				= base.GetCookie("_txtLimitTotalFilesCount");
				}
				if (base.GetCookie("_txtLimitTotalFilesLength") == "")
				{
					this._txtLimitTotalFilesLength.Text				= FileUpload1.Limit.TotalFilesLength.ToString();
				}
				else
				{
					this._txtLimitTotalFilesLength.Text				= base.GetCookie("_txtLimitTotalFilesLength");
				}
				if (base.GetCookie("_ddlLimitTotalFilesUnit") == "")
				{
					_ddlLimitTotalFilesUnit.SelectedValue		= FileUpload1.Limit.TotalFilesUnit.ToString();
				}
				else
				{
					this.SetDropDownCookieValue(_ddlLimitTotalFilesUnit, "_ddlLimitTotalFilesUnit");
				}
				#endregion
				
				#region 기타
				base.SetListItem(_ddlFileNameFormat, this.GetFileNameFormat(), "TOTAL_CODE", "CODE_NAME");
				base.SetListItem(_ddlIndividualFileClickMode, this.GetIndividualFileClickMode(), "TOTAL_CODE", "CODE_NAME");
				base.SetListItem(_rblUseBananaAgent, this.GetBoolean(), "TOTAL_CODE", "CODE_NAME");
				
				this.SetDropDownCookieValue(_ddlFileNameFormat, "_ddlFileNameFormat");
				this.SetDropDownCookieValue(_ddlIndividualFileClickMode, "_ddlIndividualFileClickMode");
				this.SetBooleanCookieValue(_rblUseBananaAgent, "_rblUseBananaAgent");
				#endregion
			}

			// 환경설정 로드
			this.LoadFileUploadConfiguration();
		}
		#endregion

		#region LoadFileUploadConfiguration : 현재 설정값을 파일업로드 컨트롤에 적용
		/// <summary>
		/// 현재 설정값을 파일업로드 컨트롤에 적용
		/// </summary>
		void LoadFileUploadConfiguration()
		{
			try
			{
				// Buttons
				FileUpload1.Buttons.ShowAdd						= Convert.ToBoolean(_rblButtonsShowAdd.SelectedValue);
				FileUpload1.Buttons.ShowRemoveAllFiles			= Convert.ToBoolean(_rblButtonsShowRemoveAllFiles.SelectedValue);
				FileUpload1.Buttons.ShowRemoveSelectedFiles		= Convert.ToBoolean(_rblButtonsShowRemoveSelectedFiles.SelectedValue);
				FileUpload1.Buttons.ShowStartUpload				= Convert.ToBoolean(_rblButtonsShowStartUpload.SelectedValue);

				// DownloadManager
				FileUpload1.DownloadManager.EnableCancelButton			= Convert.ToBoolean(_rblDownloadManagerEnableCancelButton.SelectedValue);
				FileUpload1.DownloadManager.EnableChangeFolderButton	= Convert.ToBoolean(_rblDownloadManagerEnableChangeFolderButton.SelectedValue);
				FileUpload1.DownloadManager.EnableOpenFolderButton		= Convert.ToBoolean(_rblDownloadManagerEnableOpenFolderButton.SelectedValue);
				FileUpload1.DownloadManager.RootFolder					= (BANANA.Common.DownloadRootFolder)Enum.Parse(typeof(BANANA.Common.DownloadRootFolder), _ddlDownloadManagerRootFolder.SelectedValue);

				// Limit
				if (_txtLimitIndividualFileLength.Text != "")
				{
					FileUpload1.Limit.IndividualFileLength			= Convert.ToInt32(_txtLimitIndividualFileLength.Text);
				}
				if (_txtLimitPermittedExtensions.Text != "")
				{
					FileUpload1.Limit.PermittedExtensions			= _txtLimitPermittedExtensions.Text;
				}
				if (_txtLimitTotalFilesCount.Text != "")
				{
					FileUpload1.Limit.TotalFilesCount				= Convert.ToInt32(_txtLimitTotalFilesCount.Text);
				}
				if (_txtLimitTotalFilesLength.Text != "")
				{
					FileUpload1.Limit.TotalFilesLength				= Convert.ToInt32(_txtLimitTotalFilesLength.Text);
				}

				// 기타
				FileUpload1.IndividualFileClickMode		= (BANANA.Web.Controls.IndividualFileClickMode)Enum.Parse(typeof(BANANA.Web.Controls.IndividualFileClickMode), _ddlIndividualFileClickMode.SelectedValue);
				FileUpload1.FileNameFormat				= (BANANA.Web.Controls.FileNameFormat)Enum.Parse(typeof(BANANA.Web.Controls.FileNameFormat), _ddlFileNameFormat.SelectedValue);
			}
			catch
			{
				throw;
			}
		}
		#endregion

		#region SetBooleanCookieValue : 라디오버튼 리스트 쿠키값 바인딩
		/// <summary>
		/// 라디오버튼 리스트 쿠키값 바인딩
		/// </summary>
		/// <param name="_rbl"></param>
		/// <param name="_cookieName"></param>
		void SetBooleanCookieValue(BANANA.Web.Controls.RadioButtonList _rbl, string _cookieName)
		{
			string _cookieValue		= base.GetCookie(_cookieName);
			if (string.IsNullOrEmpty(_cookieValue))
			{
				_rbl.SelectedValue	= "True";
			}
			else
			{
				_rbl.SelectedValue	= _cookieValue;
			}
		}
		#endregion

		#region GetBoolean : Boolean 형식의 데이터 테이블 반환
		/// <summary>
		/// Boolean 형식의 데이터 테이블 반환
		/// </summary>
		/// <returns></returns>
		DataTable GetBoolean()
		{
			DataTable _retValue		= new DataTable();
			_retValue.Columns.Add("TOTAL_CODE", typeof(string));
			_retValue.Columns.Add("CODE_NAME", typeof(string));
			
			_retValue.Rows.Add("True", "True");
			_retValue.Rows.Add("False", "False");

			return _retValue;
		}
		#endregion

		#region SetDropDownCookieValue : 드랍다운 리스트에 쿠키값 바인딩
		/// <summary>
		/// 드랍다운 리스트에 쿠키값 바인딩
		/// </summary>
		/// <param name="_ddl"></param>
		/// <param name="_cookieName"></param>
		void SetDropDownCookieValue(BANANA.Web.Controls.DropDownList _ddl, string _cookieName)
		{
			string _cookieValue		= base.GetCookie(_cookieName);
			if (!string.IsNullOrEmpty(_cookieValue))
			{
				_ddl.SelectedValue	= _cookieValue;
			}
		}
		#endregion

		#region GetRootFolder : RootFolder 형식의 데이터 테이블 반환
		/// <summary>
		/// RootFolder 형식의 데이터 테이블 반환
		/// </summary>
		/// <returns></returns>
		DataTable GetRootFolder()
		{
			DataTable _retValue		= new DataTable();
			_retValue.Columns.Add("TOTAL_CODE", typeof(string));
			_retValue.Columns.Add("CODE_NAME", typeof(string));
			
			_retValue.Rows.Add("NotSet", "NotSet");
			_retValue.Rows.Add("Desktop", "Desktop");
			_retValue.Rows.Add("DesktopDirectory", "DesktopDirectory");
			_retValue.Rows.Add("MyDocuments", "MyDocuments");
			_retValue.Rows.Add("MyMusic", "MyMusic");
			_retValue.Rows.Add("MyVideos", "MyVideos");
			_retValue.Rows.Add("MyPictures", "MyPictures");
			_retValue.Rows.Add("MyComputer", "MyComputer");
			_retValue.Rows.Add("CommonDesktopDirectory", "CommonDesktopDirectory");
			_retValue.Rows.Add("CommonDocuments", "CommonDocuments");
			_retValue.Rows.Add("CommonMusic", "CommonMusic");
			_retValue.Rows.Add("CommonVideos", "CommonVideos");
			_retValue.Rows.Add("CommonPictures", "CommonPictures");
			_retValue.Rows.Add("CommonApplicationData", "CommonApplicationData");
			_retValue.Rows.Add("ApplicationData", "ApplicationData");
			_retValue.Rows.Add("LocalApplicationData", "LocalApplicationData");
			_retValue.Rows.Add("InternetCache", "InternetCache");

			return _retValue;
		}
		#endregion

		#region GetFileNameFormat : FileNameFormat 형식의 데이터 테이블 반환
		/// <summary>
		/// FileNameFormat 형식의 데이터 테이블 반환
		/// </summary>
		/// <returns></returns>
		DataTable GetFileNameFormat()
		{
			DataTable _retValue		= new DataTable();
			_retValue.Columns.Add("TOTAL_CODE", typeof(string));
			_retValue.Columns.Add("CODE_NAME", typeof(string));
			
			_retValue.Rows.Add("Guid_FileName", "Guid_FileName");
			_retValue.Rows.Add("FileName_Guid", "FileName_Guid");

			return _retValue;
		}
		#endregion

		#region GetFileUnit : FileUnit 형식의 데이터 테이블 반환
		/// <summary>
		/// GetFileUnit 형식의 데이터 테이블 반환
		/// </summary>
		/// <returns></returns>
		DataTable GetFileUnit()
		{
			DataTable _retValue		= new DataTable();
			_retValue.Columns.Add("TOTAL_CODE", typeof(string));
			_retValue.Columns.Add("CODE_NAME", typeof(string));
			
			_retValue.Rows.Add("B", "B");
			_retValue.Rows.Add("KB", "KB");
			_retValue.Rows.Add("MB", "MB");
			_retValue.Rows.Add("GB", "GB");

			return _retValue;
		}
		#endregion

		#region GetIndividualFileClickMode : IndividualFileClickMode 형식의 데이터 테이블 반환
		/// <summary>
		/// GetIndividualFileClickMode 형식의 데이터 테이블 반환
		/// </summary>
		/// <returns></returns>
		DataTable GetIndividualFileClickMode()
		{
			DataTable _retValue		= new DataTable();
			_retValue.Columns.Add("TOTAL_CODE", typeof(string));
			_retValue.Columns.Add("CODE_NAME", typeof(string));
			
			_retValue.Rows.Add("DocumentViewer", "DocumentViewer");
			_retValue.Rows.Add("DownloadManager", "DownloadManager");
			_retValue.Rows.Add("DirectDownload", "DirectDownload");

			return _retValue;
		}
		#endregion

		#region _btnApply_01_Click : 옵션적용 버튼 클릭 이벤트
		/// <summary>
		/// 옵션적용 버튼 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnApply_01_Click(object sender, EventArgs e)
		{
			try
			{
				#region Buttons
				base.SetCookie("_rblButtonsShowAdd", _rblButtonsShowAdd.SelectedValue);
				base.SetCookie("_rblButtonsShowRemoveAllFiles", _rblButtonsShowRemoveAllFiles.SelectedValue);
				base.SetCookie("_rblButtonsShowRemoveSelectedFiles", _rblButtonsShowRemoveSelectedFiles.SelectedValue);
				base.SetCookie("_rblButtonsShowStartUpload", _rblButtonsShowStartUpload.SelectedValue);
				#endregion

				#region DownloadManager
				base.SetCookie("_txtDownloadManagerDefaultFolder", _txtDownloadManagerDefaultFolder.Text);
				base.SetCookie("_rblDownloadManagerEnableCancelButton", _rblDownloadManagerEnableCancelButton.SelectedValue);
				base.SetCookie("_rblDownloadManagerEnableChangeFolderButton", _rblDownloadManagerEnableChangeFolderButton.SelectedValue);
				base.SetCookie("_rblDownloadManagerEnableOpenFolderButton", _rblDownloadManagerEnableOpenFolderButton.SelectedValue);
				base.SetCookie("_rblDownloadManagerEnableOpenFolderButton", _rblDownloadManagerEnableOpenFolderButton.SelectedValue);
				base.SetCookie("_ddlDownloadManagerRootFolder", _ddlDownloadManagerRootFolder.SelectedValue);
				#endregion

				#region Limit
				base.SetCookie("_txtLimitIndividualFileLength", _txtLimitIndividualFileLength.Text);
				base.SetCookie("_ddlLimitIndividualFileUnit", _ddlLimitIndividualFileUnit.SelectedValue);
				base.SetCookie("_txtLimitPermittedExtensions", _txtLimitPermittedExtensions.Text);
				base.SetCookie("_txtLimitTotalFilesCount", _txtLimitTotalFilesCount.Text);
				base.SetCookie("_txtLimitTotalFilesLength", _txtLimitTotalFilesLength.Text);
				base.SetCookie("_ddlLimitTotalFilesUnit", _ddlLimitTotalFilesUnit.SelectedValue);
				#endregion

				#region 기타
				base.SetCookie("_ddlFileNameFormat", _ddlFileNameFormat.SelectedValue);
				base.SetCookie("_ddlIndividualFileClickMode", _ddlIndividualFileClickMode.SelectedValue);
				base.SetCookie("_rblUseBananaAgent", _rblUseBananaAgent.SelectedValue);
				#endregion

				Response.Redirect("Demo.aspx?r=0", false);
			}
			catch (Exception err)
			{
				BANANA.Web.MessageBox.Alert(err.Message);
			}
		}
		#endregion

		#region _btnUpload_Click : 업로드 버튼 클릭 이벤트
		/// <summary>
		/// 업로드 버튼 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnUpload_Click(object sender, EventArgs e)
		{
			try
			{
				for (int i = 0; i < FileUpload1.UploadFiles.Count; i++)
				{
					base.ExecuteNonQuery("WSP_UploadFiles_C1"
						, base.GetCookie("DemoPermanentUniqueId")
						, FileUpload1.UploadFiles[i].Guid
						, FileUpload1.UploadFiles[i].FileName
						, FileUpload1.UploadFiles[i].LogicalFilePath
						, FileUpload1.UploadFiles[i].PhysicalFilePath
						, FileUpload1.UploadFiles[i].FileSize
						);
				}

				BANANA.Web.MessageBox.Alert("포스트백에서 받았습니다.\r\n파일 업로드를 완료 하였습니다.\r\n업로드한 자료 조회 버튼을 클릭해서, 파일을 다운로드 받으세요.");
			}
			catch (Exception err)
			{
				BANANA.Web.MessageBox.Alert(err.Message);
			}
		}
		#endregion

		#region _btnQuery_Click : 조회 버튼 클릭 이벤트
		/// <summary>
		/// 조회 버튼 클릭 이벤트
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void _btnQuery_Click(object sender, EventArgs e)
		{
			try
			{
				DataTable _dt			= base.GetDataTable("WSP_UploadFiles_R1"
					, base.GetCookie("DemoPermanentUniqueId")
					);
				FileUpload1.DataSource	= _dt;
				FileUpload1.DataBind();
			}
			catch (Exception err)
			{
				BANANA.Web.MessageBox.Alert(err.Message);
			}
		}
		#endregion
	}
}