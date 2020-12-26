import 'package:flutter/material.dart';
import 'package:parsing_res/models/emp_list.dart';
import 'package:parsing_res/models/emp_model.dart';
import 'package:parsing_res/service/http_service.dart';
class UpdatePage extends StatefulWidget {
  static const String id="update_page";
  @override
  _UpdatePageState createState() => _UpdatePageState();
}
//PUT
class _UpdatePageState extends State<UpdatePage> {
  List<Employee> lt=new List();
  String status,message;
  void _apiUpdateLt(int i){
    NetW.PUT(NetW.API_EMP_UPDATE+i.toString(),NetW.paramsEmpty()).then((response){
      print(response);
      _showResponse(response);
    });
  }
  void _showResponse(String response){
    EmpList empLt=NetW.paramsUpdate(response);
    setState((){
      lt=empLt.data;
      status=empLt.status;
      message=empLt.message;
    });
  }
  @override
  void initState(){
    super.initState();
    _apiUpdateLt(21);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:Center(
          child:RichText(
            textAlign: TextAlign.start,
            text:TextSpan(
              text:'status:$status\n',
              style:TextStyle(color: Colors.black,fontSize: 25,),
              children: [
                TextSpan(
                    text:'data:$lt\n'
                ),
                TextSpan(
                    text:'message:$message\n'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
