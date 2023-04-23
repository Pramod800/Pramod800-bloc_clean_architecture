import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_clean_architecture/presentation/bloc/post_cubit/cubit/post_cubit.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    final posts = context.read<PostCubit>();
    posts.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
           if (state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostFetched) {
            final posts = state.postList;
            return ListView.builder(
              itemCount: posts.posts.length,
              itemBuilder: (context, index) {
                final post = posts.posts[index];
                return Card(
                  elevation: 5.0,
                  // shape: ShapeBorder.lerp(22, b, t),

                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          post.title,
                          style: TextStyle(fontSize: 22, color: Colors.green),
                        ),
                        Text(post.reactions.toString()),
                        Text(post.body),
                        Text(post.tags.toString()),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
