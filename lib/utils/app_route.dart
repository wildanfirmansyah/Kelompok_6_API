import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Kelompok_6_api/models/post.dart';
import 'package:Kelompok_6_api/pages/add_post_page.dart';
import 'package:Kelompok_6_api/pages/homepage.dart';
import 'package:Kelompok_6_api/pages/postpage.dart';

class Approutes {
  static const home = "home";
  static const post = "post";
  static const addPost = "add-post";
  static const editPost = "edit-post";

  static Page _homePageBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: HomePage());
  }

  static Page _postPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
        child: PostPage(
      post: state.extra as Post,
    ));
  }

  static Page _addPostPageBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: AddPostPage());
  }

  static Page _editPostPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
        child: AddPostPage(
      post: state.extra as Post,
    ));
  }

  static GoRouter goRouter = GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homePageBuilder,
        routes: [
          GoRoute(
            name: post,
            path: "post",
            pageBuilder: _postPageBuilder,
          ),
          GoRoute(
            name: addPost,
            path: "add-post",
            pageBuilder: _addPostPageBuilder,
          ),
          GoRoute(
            name: editPost,
            path: "edit-post",
            pageBuilder: _editPostPageBuilder,
          ),
        ],
      ),
    ],
  );
}
