import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone_test/bloc/reddit_bloc.dart';
import 'package:reddit_clone_test/constants/colors.dart';
import '../../model/welcome.dart';

class PostListWidget extends StatelessWidget {
  final Welcome? welcome;
  const PostListWidget({super.key, this.welcome});

  @override
  Widget build(BuildContext context) {
    final constantColors = ConstantColors();
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          backgroundColor: constantColors.defaultColors['white'],
          elevation: 1,
          floating: true,
          snap: true,
          toolbarHeight: 0,
          bottom: TabBar(
            labelColor: constantColors.defaultColors['black'],
            indicatorColor: constantColors.defaultColors['indicatorColor'],
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
          itemCount: welcome!.data.dist,
          itemBuilder: (context, i) => SizedBox(
            child: Card(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(welcome!
                                          .data.children[i].data.thumbnail! ==
                                      'self'
                                  ? 'https://www.splurjj.com/wp-content/uploads/2020/08/wsi-imageoptim-reddit-marketing-.jpg'
                                  : welcome!.data.children[i].data.thumbnail!),
                            ),
                            const SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' r/${welcome!.data.children[i].data.subreddit!}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' u/${welcome!.data.children[i].data.author}',
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
                          welcome!.data.children[i].data.title!,
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
                          welcome!.data.children[i].data.selftext!,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.arrow_upward),
                        const Text('Vote'),
                        const Icon(Icons.arrow_downward),
                        const Icon(Icons.chat_bubble),
                        Text(welcome!.data.children[i].data.numComments
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
}
