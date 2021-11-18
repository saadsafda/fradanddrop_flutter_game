// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, annotate_overrides, unused_field, prefer_final_fields

import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ColorGame extends StatefulWidget {
  createState() => ColorGameState();
}

class ColorGameState extends State<ColorGame> {
  final Map<String, bool> score = {};

  final Map choices = {
    '🍎': Colors.red,
    '🍊': Colors.orange,
    '🍋': Colors.yellow,
    '🥑': Colors.green,
    '🥝': Colors.brown,
    '🍑': Colors.deepOrange,
  };

  int seed = 0;

  AudioCache _audioController = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('S C O R E : ${score.length} / 6'),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: choices.keys.map((emoji) {
              return Draggable<String>(
                data: emoji,
                child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                feedback: Emoji(emoji: emoji),
                childWhenDragging: Emoji(emoji: '💩'),
              );
            }).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                  ..shuffle(Random(seed)),
          ),
        ],
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (context, incoming, rejected) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.green,
            child: Center(
              child: Text(
                'Correct',
                style: TextStyle(color: Colors.white, fontSize: 50.0),
              ),
            ),
          );
        } else {
          return Container(
            color: choices[emoji],
            height: 80,
            width: 200,
          );
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
          _audioController.play('note4.wav');
        });
      },
      onLeave: (data) {},
    );
  }
}

//  implement the stateless widget Emoji
class Emoji extends StatelessWidget {
  const Emoji({Key? key, required this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        child: Text(
          emoji,
          style: TextStyle(
            color: Colors.black,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
