import 'emp_model.dart';

class EmpList{
  String status;
  String message;
  List<Employee> data;
  EmpList.fromJson(Map<String,dynamic> json):
      status=json['status'],
      message=json['message'],
      data=List<Employee>.from(json['data'].map((i)=>Employee.fromJson(i)));
  Map<String,dynamic> toJson(){
    return {
      'status':this.status,
      'message':this.message,
      'data':new List<dynamic>.from(this.data.map((i)=>i.toJson())),
    };
  }
}