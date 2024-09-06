
import 'package:mindlink_blog/data/model/video_model.dart';



abstract class VideoState {
  final List<VideoModel> videos;

  VideoState(this.videos);
}

class VideoInitialState extends VideoState{
  VideoInitialState():super([]);
  
}
class VideoLoadingState extends VideoState{
  VideoLoadingState(super.videos);
  
}

class VideoLoadedState extends VideoState{
  VideoLoadedState(super.videos);
  
}
class VideoErrorState extends VideoState{final String message ;
  VideoErrorState(this.message, super.videos);
}