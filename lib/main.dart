import 'package:dio_demo/viewModels/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostViewModel(),
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: postProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : postProvider.error.isNotEmpty
              ? Center(child: Text('Error: ${postProvider.error}'))
              : ListView.builder(
                  itemCount: postProvider.posts.length,
                  itemBuilder: (context, index) {
                    final post = postProvider.posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => postProvider.fetchPosts(),
        tooltip: 'Fetch Posts',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
