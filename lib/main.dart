import 'package:flutter/material.dart';
import 'package:parsing_res/pages/create_page.dart';
import 'package:parsing_res/pages/delete_page.dart';
import 'package:parsing_res/pages/emp_single.dart';
import 'package:parsing_res/pages/home_page.dart';
import 'package:parsing_res/pages/update_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes:{
        HomePage.id:(context)=>HomePage(),
        EmpSingle.id:(context)=>EmpSingle(),
        CreatePage.id:(context)=>CreatePage(),
        UpdatePage.id:(context)=>UpdatePage(),
        DeletePage.id:(context)=>DeletePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

