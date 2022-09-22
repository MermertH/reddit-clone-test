import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone_test/services/api.dart';
import 'package:reddit_clone_test/view/widgets/bottom_navigation_bar_widget.dart';
import 'package:reddit_clone_test/view/widgets/custom_appbar.dart';
import 'package:reddit_clone_test/view/widgets/post_list_widget.dart';
import '../bloc/reddit_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RedditBloc(
        RepositoryProvider.of<RedditApiServices>(context),
      )..add(LoadApiEvent()),
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: const CustomAppBar(),
          body: BlocBuilder<RedditBloc, RedditState>(
            builder: (context, state) {
              if (state is RedditLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is RedditLoadedState) {
                return PostListWidget(welcome: state.welcome);
              }
              return const Center(
                child: Text('an error occured'),
              );
            },
          ),
          bottomNavigationBar: const BottomNavigationBarWidget(),
        ),
      ),
    );
  }
}
