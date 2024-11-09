import 'package:studyhall/components/galeria_post.dart';

abstract class PostRepo {
  Future<List<GaleriaPost>> fetchAllPosts();
  Future<void> createPost(GaleriaPost post);
  Future<void> deletePost(String postId);
  Future<List<GaleriaPost>> fetchPostsByUserId(String userId);
}