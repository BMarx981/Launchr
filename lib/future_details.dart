import 'package:flutter/material.dart';

class FutureDetails extends StatefulWidget {
  static const String id = 'futureDetails';
  final dynamic details;
  FutureDetails({Key key, @required this.details}) : super(key: key);
  @override
  _FutureDetailsState createState() => _FutureDetailsState();
}

class _FutureDetailsState extends State<FutureDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.details['mission_name']),
      ),
    );
  }
}
