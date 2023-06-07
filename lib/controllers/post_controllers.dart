import 'dart:convert';
import 'dart:io';

import '../models/post.dart';
import '../services/post_service.dart';


class PostController {
  Future<List<Post>> fetchAll() async {
    return await PostService().fetch().then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
          jsonData.length,
          (index) => Post.fromMap(
            jsonData[index],
          ), // Post.fromMap
        ); // List.generate
      } else {
        throw Exception();
      }
    });
  }


  Future<List<Comment>> fetchComments(int.id){
    return await PostService().fetchComments(id).then((res){
      if (res.statusCode == HttpStatus.ok){
      var jsonData = jsonDecode(res.body);
      return List.generate(jsonBody.length, (index) => Comment.fromMap(jsonData[index]));
      }else {
        throw Exception();
      }
    });
  }

  Future<bool> delete(int id){
    return await PostService().delete(id).then((res){
      inspect(res);
      if (res.statusCode == HttpStatus.ok){
        return true;
      }else{
        return false;
      }
    });
  }
}
