import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mindlink_blog/data/repository/blog_repository.dart';
import 'package:mindlink_blog/logic/cubits/blog_cubit/blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitialState()) {
    _initialize();
  }
  final _repository = BlogRepository();

  void _initialize() async {
    try {
      emit(BlogLoadingState(state.blogs));
      final blogs = await _repository.getAllBlogs();

      emit(BlogLoadedState(blogs));
    } catch (e) {
      emit(BlogErrorState(e.toString(), state.blogs));
    }
  }
}
