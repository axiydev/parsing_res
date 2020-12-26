import 'dart:convert';

import 'package:http/http.dart';
import 'package:parsing_res/models/emp_delete.dart';
import 'package:parsing_res/models/emp_list.dart';
import 'package:parsing_res/models/emp_model.dart';
import 'package:parsing_res/models/emp_model_for_create.dart';
import 'package:parsing_res/models/emp_one.dart';
class NetW{
  static String BASE='dummy.restapiexample.com';
  static Map<String,String> headers={
    "Content-type":"application/json;charset=UTF-8",
  };

  static String API_EMP_LIST='/api/v1/employees';
  static String API_EMP_ONE='/api/v1/employee/';//{{id}}
  static String API_EMP_CREATE='/api/v1/create';
  static String API_EMP_UPDATE='/api/v1/update/';//{{id}}
  static String API_EMP_DELETE='/api/v1/delete/';//{{id}}

  static Future<String> GET(String api,Map<String,String> params)async{
    var uri=Uri.http(BASE,api,params);
    var response=await get(uri,headers:headers);
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }
 static Future<String> POST(String api,Map<String,String> params)async{
    var uri=Uri.http(BASE,api,);
    var response=await post(uri,headers: headers,body:jsonEncode(params));
    if(response.statusCode==200||response.statusCode==201){
      return response.body;
    }
    return null;
 }
static Future<String> PUT(String api,Map<String,String> params)async{
    var uri=Uri.http(BASE,api);
    var response=await put(uri,headers: headers,body:jsonEncode(params));
    if(response.statusCode==200){
      return response.body;
    }
    return null;
}
  //del
  static Future<String> DEL(String api,Map<String,String> params)async{
    var uri=Uri.http(BASE,api,params);
    var response=await delete(uri,headers: headers,);
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }
  //put
  static EmpList paramsUpdate(String response){
    dynamic json=jsonDecode(response);
    var data=EmpList.fromJson(json);
    return data;
  }
  static Map<String,String> paramsEmpty(){
    Map<String,String> params=new Map();
    return params;
  }
  //emplist
  static EmpList paramsEmpList(String response){
    dynamic json=jsonDecode(response);
    var data=EmpList.fromJson(json);
    return data;
  }
  //empOne
  static EmpOne paramsEmpOne(String body){
    dynamic json=jsonDecode(body);
    var data=EmpOne.fromJson(json);
    return data;
  }
//empcreate
  static EmpCreate paramsEmpCreate(String body){
    dynamic json=jsonDecode(body);
    var data =EmpCreate.fromJson(json);
    return data;
  }
//  delete
static EmpDelete paramsDelete(String body){
 dynamic json=jsonDecode(body);
 var data=EmpDelete.fromJson(json);
 return data;
}
}