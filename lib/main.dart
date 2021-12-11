import 'package:admin/constants.dart';
import 'package:admin/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: LoginPage()
        // TODO: 这里要修改
      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(
      //       create: (context) => MenuController(),
      //     ),
      //   ],
      //   child: MainScreen(),
      // ),
    );
  }
}
