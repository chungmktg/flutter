import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'BottomLoader.dart';
import 'PostBloc.dart';
import 'PostEvent.dart';
import 'PostState.dart';
import 'PostWidget.dart';

class PostHomePage extends StatefulWidget {
  @override
  _PostHomePageState createState() => _PostHomePageState();
}

class _PostHomePageState extends State<PostHomePage> {
  final _scrollController = ScrollController();
  final PostBloc _postBloc = PostBloc(httpClient: http.Client());
  final _scrollThreshold = 200.0;

  _PostHomePageState() {
    _scrollController.addListener(_onScroll);
    _postBloc.dispatch(Fetch());
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Infinite Scroll',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Posts'),
          ),
          body: BlocBuilder(
            bloc: _postBloc,
            builder: (BuildContext context, PostState state) {
              if (state is PostUninitialized) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PostError) {
                return Center(
                  child: Text('failed to fetch posts'),
                );
              }
              if (state is PostLoaded) {
                if (state.posts.isEmpty) {
                  return Center(
                    child: Text('no posts'),
                  );
                }
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.posts.length
                        ? BottomLoader()
                        : PostWidget(post: state.posts[index]);
                  },
                  itemCount: state.hasReachedMax
                      ? state.posts.length
                      : state.posts.length + 1,
                  controller: _scrollController,
                );
              }
            },
          ),
        ));
  }

  @override
  void dispose() {
    _postBloc.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.dispatch(Fetch());
    }
  }
}
