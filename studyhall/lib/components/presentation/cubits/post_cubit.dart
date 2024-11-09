import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhall/components/presentation/cubits/post_states.dart';
import 'package:studyhall/components/repos/post_repo.dart';
import 'package:studyhall/components/storageDomain/storage_repo.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepo postRepo;
  final StorageRepo storageRepo;

  PostCubit({
    required this.postRepo,
    required this.storageRepo,
  }) : super(PostInitial());

  Future<void> getPosts() async {
    try {
      emit(PostLoading());
      final posts = await _postRepository.getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}