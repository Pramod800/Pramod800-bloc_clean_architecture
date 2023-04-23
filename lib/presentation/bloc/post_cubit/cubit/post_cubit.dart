import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app_clean_architecture/data/models/postModel.dart';
import 'package:flutter_bloc_app_clean_architecture/data/repository/repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final Repository _repository;

  PostCubit(this._repository) : super(PostInitial());
  void getPosts() async {
    // loading state
    emit(PostLoading());
    try {
      final postList = await _repository.getPosts();
      emit(PostFetched(postList));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
