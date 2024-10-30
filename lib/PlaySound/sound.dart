import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlaySound extends StatefulWidget {
  const PlaySound({super.key});

  @override
  State<PlaySound> createState() => _PlaySoundState();
}

class _PlaySoundState extends State<PlaySound> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.blue,
          title: const Text('Sound Playing',style: TextStyle(color: Colors.white),),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: ()async {
              final AudioPlayer player = AudioPlayer();
                await player.play(AssetSource('audio/audio.mp3'));
            },
            child: const Text('Click Here to Play Sound'),
          ),
        ),
      )
    );
  }
}
