<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUpload.aspx.cs" Inherits="demo.bananaframework.net._Test.FileUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<script type="text/javascript">
		//function fileSelected() {
		//	var file = document.getElementById('fileToUpload').files[0];
		//	if (file) {
		//		var fileSize = 0;
		//		if (file.size > 1024 * 1024)
		//			fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
		//		else
		//			fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';

		//		document.getElementById('fileName').innerHTML = 'Name: ' + file.name;
		//		document.getElementById('fileSize').innerHTML = 'Size: ' + fileSize;
		//		document.getElementById('fileType').innerHTML = 'Type: ' + file.type;
		//	}
		//}

		//function uploadFile() {
		//	var xhr = new XMLHttpRequest();
		//	var fd = document.getElementById('form1').getFormData();

		//	/* event listners */
		//	xhr.upload.addEventListener("progress", uploadProgress, false);
		//	xhr.addEventListener("load", uploadComplete, false);
		//	xhr.addEventListener("error", uploadFailed, false);
		//	xhr.addEventListener("abort", uploadCanceled, false);
		//	/* Be sure to change the url below to the url of your upload server side script */
		//	xhr.open("POST", "UploadMinimal.aspx");
		//	xhr.send(fd);
		//}

		//function uploadProgress(evt) {
		//	if (evt.lengthComputable) {
		//		var percentComplete = Math.round(evt.loaded * 100 / evt.total);
		//		document.getElementById('progressNumber').innerHTML = percentComplete.toString() + '%';
		//	}
		//	else {
		//		document.getElementById('progressNumber').innerHTML = 'unable to compute';
		//	}
		//}

		//function uploadComplete(evt) {
		//	/* This event is raised when the server send back a response */
		//	alert(evt.target.responseText);
		//}

		//function uploadFailed(evt) {
		//	alert("There was an error attempting to upload the file.");
		//}

		//function uploadCanceled(evt) {
		//	alert("The upload has been canceled by the user or the browser dropped the connection.");
		//}

		var uploadComplete = function () {
            var formData = new FormData();
            formData.append('fileName', file.name);
            formData.append('completed', true);

            var xhr2 = new XMLHttpRequest();
            xhr2.open("POST", "FileUpload.ashx", true); //combine the chunks together
            xhr2.send(formData);
        }

        function upload(file) {
            var blob = file;
            var BYTES_PER_CHUNK = 77570; // sample chunk sizes.
            var SIZE = blob.size;

            //upload content
            var start = 0;
            var end = BYTES_PER_CHUNK;
            var completed = 0;
            var count = SIZE % BYTES_PER_CHUNK == 0 ? SIZE / BYTES_PER_CHUNK : Math.floor(SIZE / BYTES_PER_CHUNK) + 1;

            while (start < SIZE) {
                var chunk = blob.webkitSlice(start, end);
                var xhr = new XMLHttpRequest();
                xhr.onload = function () {
                    completed = completed + 1;
                    if (completed === count) {
                        uploadComplete();
                    }
                };
                xhr.open("POST", "/Files/MultiUpload", true);
                xhr.send(chunk);

                start = end;
                end = start + BYTES_PER_CHUNK;
            }
        }

		function uploadFile() {
			var file = document.getElementById('fileToUpload').files[0];
			upload(file);
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<div class="row">
			<label for="fileToUpload">Select a File to Upload</label><br />
			<input type="file" name="fileToUpload" id="fileToUpload" />
		</div>
		<div id="fileName"></div>
		<div id="fileSize"></div>
		<div id="fileType"></div>
		<div class="row">
			<input type="button" onclick="uploadFile()" value="Upload" />
		</div>
		<div id="progressNumber"></div>
	</form>
</body>
</html>
