import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:study_dote/utils/urls.dart';
import 'package:study_dote/utils/my_prefs.dart';


class ApiRequest{

  static Future<bool> register(String name,String email,String password) async{
    var response = await post(Urls.register, body: {'full_name': name,'email':email,'password':password});
    var jsonData = json.decode(response.body);
    print('${jsonData.toString()}');
    return true;
  }

  static Future<String> getAuthTokenAgain() async {
    Map<String,String> headers = {'Content-Type':'application/json','Accept': 'application/json',
      'authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};

    MyPrefs.isUserLoggedIn().then((bool value) async {
      if(value){
        MyPrefs.getAllCreds().then( (Map<String,dynamic> data) async {
          var response = await post(Urls.getToken,
            headers: headers,
            body: jsonEncode({"grant_type":"password","username":data['email'],"password":data['password'],"scope":"offline_access"}),
          );
          var jsonData = jsonDecode(response.body);
          if (jsonData['access_token'] != null) {
            MyPrefs.setTokens(jsonData['access_token'],jsonData['refresh_token']).then((bool onValue){
              return jsonData['access_token'];
            });
          }
        });
      }else{
        print('Something wrong');
      }
    });
    return 'Something wrong';
  }




}