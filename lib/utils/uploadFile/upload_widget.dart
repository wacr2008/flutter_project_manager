import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'file_item.dart';
import 'file_item_widget.dart';


class UploadWidget extends StatefulWidget {
  @override
  _UploadWidgetState createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  List<UploadFileItem> _files = [];

  _selectFile() {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = false;
    uploadInput.click();
    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      var fileItem = UploadFileItem(files![0]);
      setState(() {
        _files.add(fileItem);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    ElevatedButton _selectButton = ElevatedButton(
        child: Text('选择文件上传'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 0,
        ),
        onPressed: _selectFile
      );


    var filesList = _files.map(_fileItem);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 8),
          child: _selectButton,
        ),
        SizedBox(height: 10.0),
        ...filesList
      ],
    );
  }

  _delete(UploadFileItem fileItem) {
    setState(() {
      _files.remove(fileItem);
    });
  }

  Widget _fileItem(UploadFileItem fileItem) {
    return FileItemWidget(
      fileItem: fileItem,
      onDeleteFile: _delete,
    );
  }
}
