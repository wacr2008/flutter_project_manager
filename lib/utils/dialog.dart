import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtil{
  static void showMyDialog(BuildContext context, Widget child, String title){
    showDialog(
      context: context,
      builder: (context) {
        return  SimpleDialog(
          title: Text(title),
          children:[
            GestureDetector(
              child:  SingleChildScrollView(
                child: child,
              ) ,
              onTap: ()=> Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}