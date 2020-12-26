import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsing_res/models/emp_list.dart';
import 'package:parsing_res/models/emp_model.dart';
import 'package:parsing_res/pages/delete_page.dart';
import 'package:parsing_res/pages/update_page.dart';
import 'package:parsing_res/service/http_service.dart';
import 'package:parsing_res/models/emp_one.dart';

import 'create_page.dart';
import 'emp_single.dart';
class HomePage extends StatefulWidget{
  static const String id="home_page";
  @override
  _HomePageState createState()=>_HomePageState();
}
class _HomePageState extends State<HomePage>{
  String data;
  List<Employee> lt=new List();
  void _apiEmpList(){
    NetW.GET(NetW.API_EMP_LIST,NetW.paramsEmpty()).then((response){
      print(response);
      _showResponse(response);
    });
  }
  //empOne
  void _apiEmpOne(int id){
    NetW.GET(NetW.API_EMP_ONE+id.toString(),NetW.paramsEmpty()).then((response){
      print(response);
      _showResponse(response);
    });
  }
  void _showResponse(String response){
    EmpList empList=NetW.paramsEmpList(response);
    print(empList.data.first.employee_name);
    setState(() {
      lt=empList.data;
    });
  }

  @override
  void initState(){
    super.initState();
    _apiEmpList();
    // _apiEmpOne(1);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Parsing List'),
        centerTitle:false,
        elevation: 0.0,
        actions:[
          //#create method post
          IconButton(
            icon:Icon(Icons.add),
            onPressed: ()async{
              await Navigator.pushNamed(context,CreatePage.id);
            },
          ),
          //#update method put
          IconButton(
            icon:Icon(Icons.update),
            onPressed: ()async{
              await Navigator.pushNamed(context,UpdatePage.id);
            },
          ),
          //#delete method delete
          IconButton(
            icon:Icon(Icons.delete),
            onPressed: ()async{
              await Navigator.pushNamed(context,DeletePage.id);
            },
          ),
          // IconButton(),
          // IconButton(),
        ],
      ),
     body:SafeArea(
      child:ListView.builder(
        itemCount: lt.length,
        itemBuilder: (ctx,index){
          return _itemsOfList(lt[index]);
        },
      ),
      ),
    );
  }
  Widget _itemsOfList(item){
    return GestureDetector(
        onTap:()async{
          await Navigator.pushNamed(context,EmpSingle.id);
        },
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(bottom: 10,top: 10),
          child:RichText(
            textAlign: TextAlign.start,
            text:TextSpan(
              text:'${item.employee_name}(${item.employee_age})\n',
              style:TextStyle(fontSize: 25,color:Colors.black,height: 1.3),
              children:[
                TextSpan(
                  text:'${item.employee_salary}\$',
                ),
              ],
            ),
          ),
        ),
    );
  }
}