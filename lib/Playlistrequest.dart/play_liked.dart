import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:just_audio/just_audio.dart';

class playLiked extends StatefulWidget {
  const playLiked({Key? key,required this.songurl}) : super(key: key);
final String songurl; 
  @override
  State<playLiked> createState() => _playLikedState();
}

class _playLikedState extends State<playLiked> {
  
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isplaying = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    playSong();
  }
   void playSong() {
    try {
      _audioPlayer.setAudioSource(AudioSource.uri(
        Uri.parse(widget.songurl),
      ));
      _audioPlayer.play();
      _isplaying = true;
    } on Exception {
      log("Cannot Parse Song");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

     Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding:  EdgeInsets.all(16.0),
          child: Column(

        children: [
                    CircleAvatar(
                      radius: 100,
                      child: Icon(
                        Icons.music_note,
                        size: 80,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ignore: prefer_const_constructors
                    Text('YOUR SONG',
                      // "song name",
                      // widget.song.name,
                     // widget.songModel.displayNameWOExt,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ignore: prefer_const_constructors
                    Text("artist name",
                      // "artist name",
                      //widget.song.name,
                      // widget.songModel.artist.toString() == "<unknown>"
                      //     ? "Unkown Artist"
                      //     : widget.songModel.artist.toString(),
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("0.0"),
                        Expanded(
                          child: Slider(value: 0.0, onChanged: (value) {}),
                        ),
                        Text("0.0"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.skip_previous_outlined),
                          highlightColor: Colors.white,
                          iconSize: 40,
                          onPressed: () {},
                        ),
                        IconButton(
                            icon: Icon(
                                _isplaying ? Icons.pause : Icons.play_arrow),
                            highlightColor: Colors.white,
                            iconSize: 40,
                            onPressed: () {
                              setState(() {
                                if (_isplaying) {
                                  _audioPlayer.pause();
                                  // _isplaying = false;
                                } else {
                                  _audioPlayer.play();
                                }
                                _isplaying = !_isplaying;
                              });
                            }),
                        IconButton(
                          icon: const Icon(Icons.skip_next_outlined),
                          highlightColor: Colors.white,
                          iconSize: 40,
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              )
    ))],

          );
        
        
        
     

      
    
  }
}