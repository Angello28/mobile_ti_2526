class Music {
  final String title;
  final String artist;
  final String duration;
  final String cover;

  Music(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.cover});

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
        title: json["title"] ?? "",
        artist: json["artist"] ?? "",
        duration: json["duration"] ?? "",
        cover: json["cover"] ?? "");
  }
}
