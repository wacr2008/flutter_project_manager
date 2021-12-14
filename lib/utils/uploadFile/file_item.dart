import 'dart:html' as html;

enum FileStatus {
  normal,
  uploading,
  success,
  fail,
}

class UploadFileItem {
  html.File file;
  late FileStatus fileStatus;
  double progress = 0.0;

   UploadFileItem(this.file) {
    fileStatus = FileStatus.normal;
  }
}
