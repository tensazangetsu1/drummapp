import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DrumMachine());
}

class DrumMachine extends StatelessWidget {
  const DrumMachine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DrumPage(),
      ),
    );
  }
}

class DrumPage extends StatelessWidget {
  DrumPage({Key? key}) : super(key: key);

  final player = AudioCache();
  voiceplay(String voice) {
    final player = AudioPlayer();
    player.play(
      AssetSource('$voice.wav'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad(
                      'bongo',
                      Colors.blueAccent,
                    ),
                  ),
                  Expanded(
                    child: buildDrumPad(
                      'how',
                      Colors.purpleAccent,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad(
                      'clap1',
                      Colors.greenAccent,
                    ),
                  ),
                  Expanded(
                    child: buildDrumPad(
                      'bip',
                      Colors.yellowAccent,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad(
                      'clap2',
                      Colors.orange,
                    ),
                  ),
                  Expanded(
                    child: buildDrumPad(
                      'crash',
                      Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad('ridebel', Colors.brown),
                  ),
                  Expanded(
                    child: buildDrumPad(
                      'woo',
                      Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildDrumPad(String voice, Color color) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(8),
      ),
      onPressed: () async {
        voiceplay(voice);
      },
      child: Container(
        color: color,
      ),
    );
  }
}
