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
    context.read<PostCubit>().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          print('State=>> $state'); //viewing the current state in ui
          if (state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostFetched) {
            final posts = state.postList;
            return ListView.builder(
              itemCount: posts.posts.length,
              itemBuilder: (context, index) {
                // final post = posts.posts[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 5.0,
                    // shape: ShapeBorder.lerp(22, b, t),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            posts.posts[index].title,
                            style: TextStyle(fontSize: 22, color: Colors.green),
                          ),
                          Text(posts.posts[index].reactions.toString()),
                          Text(posts.posts[index].body),
                          // Text(posts.posts[index].tags.toString()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container(child: const Center(child: Text('No Posts Found')));
        },
      ),
    );
  }
}
