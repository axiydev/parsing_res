class Employee{
  String id; //int empOne
  String employee_name;
  String employee_salary;//int empOne
  String employee_age;//int empOne
  String profile_image;
  Employee.fromJson(Map<String,dynamic> json):
        id=json['id'],
        employee_name=json['employee_name'],
        employee_salary=json['employee_salary'],
        employee_age=json['employee_age'],
        profile_image=json['profile_image'];
  Map<String,dynamic> toJson(){
    return {
      'id':this.id,
      'employee_name':this.employee_name,
      'employee_salary':this.employee_salary,
      'employee_age':this.employee_age,
      'profile_image':this.profile_image,
    };
  }
}

