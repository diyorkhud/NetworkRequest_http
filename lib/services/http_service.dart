import 'dart:convert';

import 'package:http/http.dart';

import '../models/post_model.dart';

class Network{
  static String BASE = 'dummy.restapiexample.com';
  //static Map<String, String> headers = {'Content-type': 'application/json; charset=UTF-8'};

  /* Http Apis */

static String API_LIST = '/api/v1/employee/1';
static String API_CREATE = '/api/v1/create';
  static String API_UPDATE = '/posts/1'; //id
  static String API_DELETE = '/api/v1/delete/2'; //id

  /* Http Requests */
static Future<String?> GET(String api, Map<String, String> params) async{
  var uri = Uri.https(BASE, api, params);
  var response = await get(uri,);
  if(response.statusCode == 200){
    return response.body;
  }
  return null;
}

  static Future<String?> POST(String api, Map<String, String> params) async{
    var uri = Uri.https(BASE, api, params);
    var response = await post(uri, body: jsonEncode(params));
    if(response.statusCode == 200|| response.statusCode == 201){
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async{
    var uri = Uri.https(BASE, api);
    var response = await put(uri, body: jsonEncode(params));
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async{
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri,);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  /* Http Params */
static Map<String, String> paramsEmpty(){
  Map<String, String> params = Map();
  return params;
}

  static Map<String, String> paramsCreate(Post post){
    Map<String, String> params = Map();
    params.addAll({
      'name': post.name,
      'salary': post.salary.toString(),
      'age': post.age.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post){
    Map<String, String> params = Map();
    params.addAll({
      'id': post.id.toString(),
      'name': post.name,
      'salary': post.salary.toString(),
      'age': post.age.toString(),
    });
    return params;
  }



}