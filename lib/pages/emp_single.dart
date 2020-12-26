import 'package:flutter/material.dart';
import 'package:parsing_res/models/emp_one.dart';
import 'package:parsing_res/models/emp_model.dart';
import 'package:parsing_res/service/http_service.dart';
class EmpSingle extends StatefulWidget {
  static const String id='emp_single';
  @override
  _EmpSingleState createState() => _EmpSingleState();
}

class _EmpSingleState extends State<EmpSingle> {
  String name;
  int age,salary;
  void _apiEmpOne(int i){
   NetW.GET(NetW.API_EMP_ONE+i.toString(),NetW.paramsEmpty()).then((response){
     print(response);
     _showResponse(response);
   });
  }
  void _showResponse(String response){
    EmpOne empOne=NetW.paramsEmpOne(response);
    print(empOne.data.employee_name);
    setState(() {
      name=empOne.data.employee_name;
      age=empOne.data.employee_age;
      salary=empOne.data.employee_salary;
    });
  }
  @override
  void initState(){
    super.initState();
    _apiEmpOne(1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('emp single'),
        centerTitle:true,
      ),
      body:SafeArea(
        child:Center(
          child:RichText(
            textAlign: TextAlign.center,
            text:TextSpan(
              text:'$name($age)\n',
              style:TextStyle(color: Colors.black,fontSize: 25,),
              children:[
                TextSpan(
                  text:'$salary\$',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
