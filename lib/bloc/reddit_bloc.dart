import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reddit_event.dart';
part 'reddit_state.dart';

class RedditBloc extends Bloc<RedditEvent, RedditState> {
  RedditBloc() : super(RedditInitial()) {
    on<RedditEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
