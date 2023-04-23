part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

class PostFetched extends PostState {
  const PostFetched(this.postList);
  final PostModel postList;
  @override
  List<Object> get props => [postList];
}

class PostError extends PostState {
  const PostError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
