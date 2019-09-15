import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  static const String id = 'details';
  final dynamic details;
  DetailsPage({Key key, @required this.details}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future _getLinkPics() async {
    List<Container> list = [];
    if (widget.details['links']['flickr_images'] != null) {
      print(widget.details['links']['flickr_images'][0]);
      for (var links in widget.details['links']['flickr_images']) {
        list.add(links);
        print(links);
      }
    }
    return list;
  }

  String _getDate(String data) {
    DateTime dateTime = DateTime.parse(data);
    if (dateTime == null) {
      return "";
    } else {
      return '${dateTime.month}/${dateTime.day}/${dateTime.year} at \n'
          '${dateTime.hour}:${dateTime.minute}';
    }
  }

  @override
  Widget build(BuildContext context) {
//    _getLinkPics();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.details['mission_name']),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://farm2.staticflickr.com/1486/25787998624_3ca213be1e_o.jpg'),
            ),
          ),
          child: ListView(
            children: <Widget>[
              Hero(
                tag: widget.details['mission_name'],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 400.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.5),
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            widget.details['links']['mission_patch_small']),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadiusDirectional.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        //Launch title
                        padding: const EdgeInsets.fromLTRB(18.0, 8.0, 0.0, 0.0),
                        child: Container(
                          child: Text(
                            'Launched From:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        //Site name
                        padding:
                            const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 18.0),
                        child: Text(
                          widget.details['launch_site']['site_name_long'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        //Launch date local
                        padding: const EdgeInsets.fromLTRB(18.0, 0.0, 8.0, 8.0),
                        child: Container(
                          child: Text(
                            _getDate(widget.details['launch_date_local']),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      widget.details['details'] != null
                          ? widget.details['details']
                          : 'No Details',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
