class PodcastModel {
  final int? id;
  final String? title, author, imageUrl, playbackId;

  PodcastModel(
      {this.id, this.title, this.author, this.imageUrl, this.playbackId});

  factory PodcastModel.fromJson(Map<String, dynamic> json) {
    return PodcastModel(
        id: json['id'],
        title: json['attributes']['title'],
        imageUrl:
            json['attributes']['image']['data']?['attributes']['url'] ?? "",
        playbackId: json['attributes']['playback_id'],
        author: json['attributes']['author']);
  }
}
