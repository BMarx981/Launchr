import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'package:photofilters/photofilters.dart';

class PastLaunchesScreen extends StatefulWidget {
  static const String id = 'past';
  final List<dynamic> pList;
  PastLaunchesScreen({Key key, @required this.pList}) : super(key: key);
  @override
  _PastLaunchesScreenState createState() => _PastLaunchesScreenState();
}

class _PastLaunchesScreenState extends State<PastLaunchesScreen> {
  List<Widget> _buildListWidget() {
    List<Widget> wList = [];
    for (var p in widget.pList) {
      wList.add(GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsPage(details: p),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Hero(
                tag: p['mission_name'],
                child: Container(
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.5),
                    image: DecorationImage(
                      image: NetworkImage(
                        p['links']['mission_patch_small'],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Text(
                p['flight_number'].toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 50.0),
            Expanded(
              flex: 3,
              child: Container(
                child: Text(
                  p['mission_name'],
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ));
    }
    return wList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to the Past'),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(//Background image from API
                  'https://farm9.staticflickr.com/8774/17170624412_7091dbd04a_o.jpg'),
            ),
          ),
          child: ListView(
            children: _buildListWidget(),
          ),
        ),
      ),
    );
  }
}
