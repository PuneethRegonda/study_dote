import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:study_dote/utils/Urls.dart';


class ApiRequest{

  static Future<bool> register(String name,String email,String password) async{
    var response = await post(Urls.register, body: {'full_name': name,'email':email,'password':password});
    var jsonData = json.decode(response.body);
    print('${jsonData.toString()}');
    return true;
  }

}