import 'package:flutter/material.dart';
import 'package:flutter_sore_5/data.dart';
import 'package:flutter_sore_5/model/playlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Playlist myPlaylist = Playlist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: myMusics.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(myMusics[index].coverSong),
              ),
              title: Text(myMusics[index].songName),
              subtitle: Text(myMusics[index].artist),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    myPlaylist.addToPlaylist(myMusics[index], context);
                  });
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.playlist_play_rounded),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("My Playlist"),
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: myPlaylist.playlist.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  myPlaylist.playlist[index].coverSong),
                            ),
                            title: Text(myPlaylist.playlist[index].songName),
                            subtitle: Text(myPlaylist.playlist[index].artist),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  myPlaylist.removeFromPlaylist(
                                      myMusics[index], context);
                                });
                              },
                            ),
                          );
                        }),
                  ),
                );
              });
        },
      ),
    );
  }
}
