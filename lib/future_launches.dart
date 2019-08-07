import 'package:flutter/material.dart';
import 'future_details.dart';

class FutureLaunchesScreen extends StatefulWidget {
  static const String id = 'future';
  final List<dynamic> fList;
  FutureLaunchesScreen({Key key, @required this.fList}) : super(key: key);
  @override
  _FutureLaunchesScreenState createState() => _FutureLaunchesScreenState();
}

class _FutureLaunchesScreenState extends State<FutureLaunchesScreen> {
  List<Widget> _buildListWidget() {
    List<Widget> wList = [];
    for (var f in widget.fList) {
      wList.add(
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FutureDetails(details: f),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.4),
                ),
                child: Text(
                  f['flight_number'].toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.01),
                  ),
                ),
                width: 50.0,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.grey.withOpacity(.4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      f['mission_name'],
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 50.0),
            ],
          ),
        ),
      );
    }
    return wList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back to the future.'),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                  'https://live.staticflickr.com/65535/48380511427_97db52a9e3_o.jpg'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView(
                    children: _buildListWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
