import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reddit_clone_test/model/welcome.dart';
import 'package:reddit_clone_test/services/api.dart';

part 'reddit_event.dart';
part 'reddit_state.dart';

class RedditBloc extends Bloc<RedditEvent, RedditState> {
  final RedditApiServices _redditApiServices;

  RedditBloc(this._redditApiServices) : super(RedditLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      emit(RedditLoadingState());
      final response = await _redditApiServices.getApiData();
      if (response.statusCode == 200) {
        emit(RedditLoadedState(welcomeFromJson(response.body)));
      } else {
        emit(RedditLoadErrorState());
      }
    });
  }
}
