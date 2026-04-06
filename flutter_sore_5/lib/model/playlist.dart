import 'package:flutter/material.dart';
import 'package:flutter_sore_5/model/music.dart';

class Playlist {
  List<Music> playlist = [];

  void addToPlaylist(Music music, BuildContext context) {
    playlist.add(music);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${music.songName} is added to playlist")));
  }

  void removeFromPlaylist(Music music, BuildContext context) {
    playlist.remove(music);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${music.songName} removed from playlist")));
  }
}
