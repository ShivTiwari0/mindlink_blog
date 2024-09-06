import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindlink_blog/data/repository/video_repository.dart';
import 'package:mindlink_blog/logic/cubits/video_cubit.dart/video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitialState()) {
    _initialize();
  }

  final repository = VideoRepository();

  void _initialize() async {
    try {
      emit(VideoLoadingState(state.videos));

    final videos = await repository.getAllVideos();
    emit(VideoLoadedState(videos));
    } catch (e) {
      emit(VideoErrorState(e.toString(), state.videos));
    }
  }
}
