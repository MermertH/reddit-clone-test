part of 'reddit_bloc.dart';

abstract class RedditState extends Equatable {
  const RedditState();
  
  @override
  List<Object> get props => [];
}

class RedditInitial extends RedditState {}
