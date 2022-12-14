part of 'reddit_bloc.dart';

abstract class RedditState extends Equatable {
  const RedditState();
}

class RedditLoadingState extends RedditState {
  @override
  List<Object> get props => [];
}

class RedditLoadedState extends RedditState {
  final Welcome welcome;

  const RedditLoadedState(this.welcome);

  @override
  List<Object?> get props => [welcome];
}

class RedditLoadErrorState extends RedditState {
  final String message = "An error occured";

  @override
  List<Object?> get props => [message];
}
