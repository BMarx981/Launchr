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
    print(
      widget.details['details'],
    );
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ContentBox(
                widget: widget,
                title: 'Upcoming Flight Date',
                content: _getDate(),
              ),
              SizedBox(
                height: 30.0,
              ),
              ContentBox(
                widget: widget,
                title: 'Rocket Type:',
                content: widget.details['rocket']['rocket_name'],
              ),
              SizedBox(
                height: 30.0,
              ),
              ContentBox(
                widget: widget,
                title: "Details",
                content: widget.details['details'] == null
                    ? 'No Details'
                    : widget.details['details'],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContentBox extends StatelessWidget {
  const ContentBox({
    Key key,
    @required this.widget,
    this.title,
    this.content,
  }) : super(key: key);

  final FutureDetails widget;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            Text(
              content,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
