import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone_test/services/api.dart';
import 'package:reddit_clone_test/view/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reddit Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RepositoryProvider(
        create: (context) => RedditApiServices(),
        child: const MainPage(),
      ),
    );
  }
}
