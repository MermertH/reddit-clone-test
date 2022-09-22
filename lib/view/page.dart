import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone_test/services/api.dart';

import '../bloc/reddit_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RedditBloc(
        RepositoryProvider.of<RedditApiServices>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reddit Clone'),
          centerTitle: true,
        ),
        body: BlocBuilder<RedditBloc, RedditState>(
          builder: (context, state) {
            if (state is RedditLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RedditLoadedState) {
              return Center(
                child: Text(
                  state.welcome.data.children[3].data.selftext!,
                  textAlign: TextAlign.center,
                ),
              );
            }
            return const Center(
              child: Text('an error occured'),
            );
          },
        ),
      ),
    );
  }
}
