import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'spaceX_model.dart';
import 'future_launches.dart';
import 'past_launches.dart';
import 'detail_page.dart';

void main() => runApp(Launchr());

class Launchr extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LaunchrHomePage.id,
      routes: {
        PastLaunchesScreen.id: (context) => PastLaunchesScreen(),
        FutureLaunchesScreen.id: (context) => FutureLaunchesScreen(),
        DetailsPage.id: (context) => DetailsPage(),
        LaunchrHomePage.id: (context) =>
            LaunchrHomePage(title: 'SpaceX Launchr'),
      },
      title: 'SpaceX Launchr',
      theme: ThemeData(
        primaryColor: Colors.grey[600],
      ),
    );
  }
}

class LaunchrHomePage extends StatefulWidget {
  LaunchrHomePage({Key key, this.title}) : super(key: key);
  static const String id = 'home';
  final String title;

  @override
  _LaunchrHomePageState createState() => _LaunchrHomePageState();
}

class _LaunchrHomePageState extends State<LaunchrHomePage> {
  List<dynamic> futureList;
  SpaceXModel s = SpaceXModel();

  @override
  void initState() {
    super.initState();
    s.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: FadeAnimatedTextKit(
          isRepeatingAnimation: true,
          text: [
            widget.title,
            'Explore Future Launches',
            'Check Past Launches',
          ],
          duration: Duration(seconds: 15),
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://farm8.staticflickr.com/7608/16661753958_9f61f777e7_o.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FrontPageButton(
                buttonText: 'Future Launches',
                tapFunc: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          FutureLaunchesScreen(fList: s.getFutureList()),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 100,
                width: 200,
              ),
              FrontPageButton(
                  buttonText: 'Past Launches',
                  tapFunc: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PastLaunchesScreen(pList: s.getPastList()),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class FrontPageButton extends StatelessWidget {
  final String buttonText;
  final Function tapFunc;
  FrontPageButton({this.buttonText, this.tapFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunc,
      child: Container(
        height: 100,
        width: 60,
        decoration: new BoxDecoration(
          color: Colors.grey[300].withOpacity(0.005),
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2.0,
              blurRadius: 20.0,
              color: Colors.grey,
              offset: Offset(5.0, 8.0),
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 28.0,
              fontFamily: 'RobotoMono',
            ),
          ),
        ),
      ),
    );
  }
}
