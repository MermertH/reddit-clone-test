import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone_test/constants/colors.dart';
import 'package:reddit_clone_test/services/api.dart';
import 'package:reddit_clone_test/widgets/custom_appbar.dart';
import '../bloc/reddit_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final constantColors = ConstantColors();
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
                return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      elevation: 1,
                      floating: true,
                      snap: true,
                      stretch: true,
                      toolbarHeight: 0,
                      //pinned: true,

                      bottom: TabBar(
                        labelColor: constantColors.defaultColors['black'],
                        indicatorColor: Colors.red,
                        tabs: const [
                          Tab(text: 'Home'),
                          Tab(text: 'Popular'),
                        ],
                      ),
                    ),
                  ],
                  body: RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    onRefresh: () async {
                      return context.read<RedditBloc>().add(LoadApiEvent());
                    },
                    child: ListView.builder(
                      itemCount: state.welcome.data.dist,
                      itemBuilder: (context, i) => SizedBox(
                        child: Card(
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: NetworkImage(state
                                                      .welcome
                                                      .data
                                                      .children[i]
                                                      .data
                                                      .thumbnail! ==
                                                  'self'
                                              ? 'https://www.splurjj.com/wp-content/uploads/2020/08/wsi-imageoptim-reddit-marketing-.jpg'
                                              : state.welcome.data.children[i]
                                                  .data.thumbnail!),
                                        ),
                                        const SizedBox(width: 5),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ' r/${state.welcome.data.children[i].data.subreddit!}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              ' u/${state.welcome.data.children[i].data.author}',
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_vert),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 4,
                                ),
                                child: Wrap(
                                  children: [
                                    Text(
                                      state
                                          .welcome.data.children[i].data.title!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: Wrap(
                                  children: [
                                    Text(
                                      state.welcome.data.children[i].data
                                          .selftext!,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.arrow_upward),
                                    const Text('Vote'),
                                    const Icon(Icons.arrow_downward),
                                    const Icon(Icons.chat_bubble),
                                    Text(state.welcome.data.children[i].data
                                        .numComments
                                        .toString()),
                                    const Icon(Icons.share),
                                    const Text('Share'),
                                    const Icon(Icons.redeem),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const Center(
                child: Text('an error occured'),
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: constantColors.defaultColors['primaryColor'],
            unselectedItemColor: constantColors.defaultColors['black'],
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.explore),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.add),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.sms),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.notifications),
              )
            ],
          ),
        ),
      ),
    );
  }
}
