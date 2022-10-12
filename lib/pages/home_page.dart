import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netdemo/services/http_service.dart';

import '../models/post_model.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String? data;

   void _apiPostList(){
     Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
       print(response),
       _showResponse(response!),
     });
   }

   void _apiCreatePost(Post post){
     Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
       print(response),
       _showResponse(response!),
     });
   }

   void _apiUpdatePost(Post post){
     Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post)).then((response) => {
       print(response),
       _showResponse(response!),
     });
   }

   void _apiDeletePost(Post post){
     Network.DEL(Network.API_DELETE, Network.paramsEmpty()).then((response) => {
       print(response),
       _showResponse(response!),
     });
   }

   void _showResponse(String response){
     setState((){
       data = response;
     });
   }

  @override
  void initState(){
    super.initState();
    var post = Post(name:'Diyor', salary: 99, age:21, id: 1);
    _apiDeletePost(post);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data ?? "No Data"),
      ),
    );
  }
}
