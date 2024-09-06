
import 'package:mindlink_blog/data/model/text_news_model.dart';



abstract class TextState {
  final List<TextNewsModel> texts;

  TextState(this.texts);
}

class TextInitialState extends TextState{
  TextInitialState():super([]);
  
}
class TextLoadingState extends TextState{
  TextLoadingState(super.texts);
  
}

class TextLoadedState extends TextState{
  TextLoadedState(super.texts);
  
}
class TextErrorState extends TextState{final String message ;
  TextErrorState(this.message, super.text);
}