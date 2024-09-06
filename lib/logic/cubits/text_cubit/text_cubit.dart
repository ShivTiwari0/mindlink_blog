import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mindlink_blog/data/repository/text_news_repository.dart';

import 'package:mindlink_blog/logic/cubits/text_cubit/text_state.dart';

class TextCubit extends Cubit<TextState> {
  TextCubit() : super(TextInitialState()) {
    _initialize();
  }
  final _repository = TextNewsRepository();

  void _initialize() async {
    try {
      emit(TextLoadingState(state.texts));
      final texts = await _repository.getAllTextNews();

      emit(TextLoadedState(texts));
    } catch (e) {
      emit(TextErrorState(e.toString(), state.texts));
    }
  }
}