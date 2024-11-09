import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studyhall/components/galeria_post.dart';
import 'package:studyhall/components/repos/post_repo.dart';

class FirebasePostRepo implements PostRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //colecao de posts
  final CollectionReference postCollection = FirebaseFirestore.instance.collection('galeria');

  @override
  Future<void> createPost(GaleriaPost post) async{
    try {
      await postCollection.doc(post.id).set(post.toJson());
    } catch (e) {
      throw Exception("Erro ... $e");
    }
  }

  @override
  Future<void> deletePost(String postId) async {
    await postCollection.doc(postId).delete();
  }

  @override
  Future<List<GaleriaPost>> fetchAllPosts() async {
    try {
      //get
      final postsSnapshot =
      await postCollection.orderBy('timestamp', descending: true).get();

      //converte para lista de posts
      final List<GaleriaPost> allPosts = postsSnapshot.docs
          .map((doc) => GaleriaPost.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return allPosts;
    } catch (e) {
      throw Exception("Erro ... $e");
    }
  }

  @override
  Future<List<GaleriaPost>> fetchPostsByUserId(String userId) async {
    try {
      //fetch com uid
      final postsSnapshot =
        await postCollection.where('userId', isEqualTo: userId).get();
      
      //converte json para lista de posts
      final userPosts = postsSnapshot.docs
          .map((doc) => GaleriaPost.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return userPosts;
    } catch (e) {
      throw Exception("Erro ... $e");
    }
  }
}