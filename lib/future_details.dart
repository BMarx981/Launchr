import 'package:flutter/material.dart';

class FutureDetails extends StatefulWidget {
  static const String id = 'futureDetails';
  final dynamic details;
  FutureDetails({Key key, @required this.details}) : super(key: key);
  @override
  _FutureDetailsState createState() => _FutureDetailsState();
}

class _FutureDetailsState extends State<FutureDetails> {
  var date = '';
  String _getDate() {
    var dateTime = DateTime.parse(widget.details['launch_date_utc']);
    return dateTime.month.toString() +
        '/' +
        dateTime.day.toString() +
        '/' +
        dateTime.year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.details['mission_name'],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'Flight Date',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Container(
              child: Text(
                _getDate(),
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
