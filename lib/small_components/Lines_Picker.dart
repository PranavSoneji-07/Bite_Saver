import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

class LinesPicker extends StatefulWidget {
  final Function(String) onLineChanged;

  const LinesPicker({required this.onLineChanged, super.key});

  @override
  _LinesPickerState createState() => _LinesPickerState();
}

class _LinesPickerState extends State<LinesPicker> {
  List<String> lines = [
    "Eat fast, or someone else will!",
    "Your wallet made a brand-new friend",
    "Who knew saving food could be this tasty?",
    "Why pay full price? That’s a scam",
    "Food waste is dumb. Cheap food isn’t",
    "Dinner? Sorted. Bank balance? Safe",
    "Good food deserves a second chance!",
    "Fresh. Cheap. Fast. No brainer",
    "Why cook when you can loot? (Legally, of course)",
    "Broke but hungry? We got you"
  ];
  var random = Random();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1, milliseconds: 100), (timer) {
      String newLine = lines[random.nextInt(10) +1 ];
      widget.onLineChanged(newLine);
    });

    Future.delayed(Duration(seconds: 6), () {
      timer?.cancel();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
