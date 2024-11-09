import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhall/components/galeria_post.dart';
import 'package:studyhall/components/presentation/cubits/post_states.dart';
import 'package:studyhall/components/repos/post_repo.dart';
import 'package:studyhall/components/storageDomain/storage_repo.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepo postRepo;
  final StorageRepo storageRepo;

  PostCubit({
    required this.postRepo,
    required this.storageRepo,
  }) : super(PostsInitial());

  // cria post
  Future<void> createPost(GaleriaPost post,
      {String? imagePath, Uint8List? imageBytes}) async {
    String? imageUrl;

    try {
      // upload mobile
    if (imagePath != null) {
      imageUrl = await storageRepo.uploadProfileImageMobile(imagePath, post.id);
    }

    // upload web
    else if (imageBytes != null) {
      emit(PostsUploading());
      imageUrl = await storageRepo.uploadProfileImageWeb(imageBytes, post.id);
    }

    // url da imagem para o post
    final newPost = post.copyWith(imageUrl: imageUrl);

    // backend do post
    postRepo.createPost(newPost);
    } catch (e) {
      emit(PostsError("falha ao criar post: $e"));
    }
  }

  // carrega posts
  Future<void> fetchAllPosts() async {
    try {
      emit(PostsLoading());
      final posts = await postRepo.fetchAllPosts();
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostsError("falha ao carregar posts: $e"));
    }
  }

  // deleta post
  Future<void> deletePost(String postId) async {
    try {
      await postRepo.deletePost(postId);
    } catch (e) {
      emit(PostsError("falha ao deletar post: $e"));
    }
  }
}