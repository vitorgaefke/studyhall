import 'package:studyhall/components/galeria_post.dart';

abstract class PostState {}

//inicial
class PostsInitial extends PostState {}

//loading
class PostsLoading extends PostState {}

//uploading
class PostsUploading extends PostState {}

//erro
class PostsError extends PostState {
  final String message;

  PostsError(this.message);
}

//carregado
class PostsLoaded extends PostState {
  final List<GaleriaPost> posts;

  PostsLoaded(this.posts);
}