import 'package:vimigo/models/post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts(bool sortORnot) async {
    List<Post> posts = [];
    var client = http.Client();
    var uri = Uri.parse('https://gorest.co.in/public/v2/posts');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var postsJson = jsonDecode(response.body);
      for (int i = 0; i < postsJson.length; i++) {
        posts.add(Post.fromJson(jsonDecode(response.body)[i]));
      }
      if (sortORnot) {
        posts.sort((a, b) => a.title.compareTo(b.title));
      }
      return posts;
      // return postFromJson(json);
    }
    return null;
  }
}
