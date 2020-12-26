import 'package:flutter/material.dart';
import 'package:parsing_res/models/emp_delete.dart';
import 'package:parsing_res/service/http_service.dart';
class DeletePage extends StatefulWidget {
  static const String id='delete_list';
  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  String status;
  String data;
  String message;
  void _apiDelList(int i){
  NetW.DEL(NetW.API_EMP_DELETE+i.toString(),NetW.paramsEmpty()).then((response){
    print(response);
    _showResponse(response);
  });
}
void _showResponse(String response){
    EmpDelete empDel=NetW.paramsDelete(response);
  setState((){
    status=empDel.status;
    data=empDel.data;
    message=empDel.message;
  });
}
@override
  void initState(){
  super.initState();
_apiDelList(2);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Delete Page'),
      ),
     body:Center(
       child:RichText(
         textAlign: TextAlign.start,
         text:TextSpan(
           text:'status:$status\n',
           style:TextStyle(color: Colors.black,fontSize: 25,),
           children: [
             TextSpan(
                 text:'data:$data\n'
             ),
             TextSpan(
                 text:'message:$message\n'
             ),
           ],
         ),
       ),
     ),
    );
  }
}
