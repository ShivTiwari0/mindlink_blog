class VideoModel {
  String? id;
  String? title;
  String? thumbnailUrl;
  String? duration;
  String? uploadTime;
  String? views;
  String? author;
  String? videoUrl;
  String? description;
  String? subscriber;
  bool? isLive;

  VideoModel(
      {this.id,
      this.title,
      this.thumbnailUrl,
      this.duration,
      this.uploadTime,
      this.views,
      this.author,
      this.videoUrl,
      this.description,
      this.subscriber,
      this.isLive});

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnailUrl = json['thumbnailUrl'];
    duration = json['duration'];
    uploadTime = json['uploadTime'];
    views = json['views'];
    author = json['author'];
    videoUrl = json['videoUrl'];
    description = json['description'];
    subscriber = json['subscriber'];
    isLive = json['isLive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['duration'] = this.duration;
    data['uploadTime'] = this.uploadTime;
    data['views'] = this.views;
    data['author'] = this.author;
    data['videoUrl'] = this.videoUrl;
    data['description'] = this.description;
    data['subscriber'] = this.subscriber;
    data['isLive'] = this.isLive;
    return data;
  }
}
