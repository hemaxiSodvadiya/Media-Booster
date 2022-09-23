import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../models.dart';

class PageD extends StatelessWidget {
  final PlayerName Page;

  PageD(this.Page);

  @override
  final assetsAudioPlayer = AssetsAudioPlayer();

  Duration _duration = const Duration(seconds: 0);

  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple.withOpacity(0.4),
        title: const Text("Audio Player"),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff2c009c),
                    Color(0xff000084),
                    Color(0xff009cfe),
                    Color(0xff00bc00),
                    Color(0xfffef600),
                    Color(0xfffe622c),
                    Color(0xffde0000),
                  ]),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff2c009c),
                    Color(0xff000084),
                    Color(0xff009cfe),
                    Color(0xff00bc00),
                    Color(0xfffef600),
                    Color(0xfffe622c),
                    Color(0xffde0000),
                  ]),
            ),
          ),
          Center(
            child: Container(
              height: 700,
              width: 400,
              color: Colors.grey.withOpacity(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Image(
                      image: NetworkImage(Page.image),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      Page.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await assetsAudioPlayer.open(
                            Audio.network(
                              "assets/${Page.name}",
                            ),
                            autoStart: true,
                            showNotification: true,
                          );

                          _duration =
                              assetsAudioPlayer.current.value!.audio.duration;
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await assetsAudioPlayer.pause();
                        },
                        icon: const Icon(
                          Icons.pause,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await assetsAudioPlayer.stop();

                          _duration = const Duration(seconds: 0);
                        },
                        icon: const Icon(
                          Icons.stop,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: StreamBuilder(
                      stream: assetsAudioPlayer.currentPosition,
                      builder: (context, Snapshots) {
                        _position =
                            (Snapshots.data as Duration).inSeconds.toDouble();
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${Snapshots.data.toString().split(".")[0]}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${_duration.toString().split(".")[0]}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Slider(
                              inactiveColor: Colors.amber,
                              activeColor: Colors.indigo,
                              value: _position,
                              min: 0,
                              max: _duration.inSeconds.toDouble(),
                              onChanged: (val) {
                                _position = val;
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
