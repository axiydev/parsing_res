import 'package:flutter/material.dart';
import 'package:parsing_res/models/emp_model_for_create.dart';
import 'package:parsing_res/service/http_service.dart';
class CreatePage extends StatefulWidget {
  static const String id='create_page';
  @override
  _CreatePageState createState() => _CreatePageState();
}
//POST
class _CreatePageState extends State<CreatePage> {
  String name;
  String salary;
  String age;
  int id;
  void _apiPostList(){
    NetW.POST(NetW.API_EMP_CREATE,NetW.paramsEmpty()).then((response){
      print(response);
      _showResponse(response);
    });
  }
  void _showResponse(String response){
    EmpCreate empCreate=NetW.paramsEmpCreate(response);
    setState((){
      name=empCreate.data.name;
      salary=empCreate.data.salary;
      age=empCreate.data.age;
      id=empCreate.data.id;
    });
  }
  @override
  void initState(){
    super.initState();
    _apiPostList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('create POST'),
      ),
      body:SafeArea(
        child:Center(
          child:RichText(
            textAlign: TextAlign.center,
            text:TextSpan(
              text:'name:$name\n',
              style:TextStyle(color: Colors.black,fontSize: 25,),
              children: [
                TextSpan(
                  text:'age:$age\n'
                ),
                TextSpan(
                    text:'salary:$salary\n'
                ),
                TextSpan(
                    text:'id:$id\n'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
