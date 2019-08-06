import 'network_helper.dart';

const url = "https://api.spacexdata.com/v3/launches/#";

class SpaceXModel {
  var now = DateTime.now();
  var fList = [];
  var pList = [];

  void fetchData() async {
    NetworkHelper helper = NetworkHelper(url);
    dynamic data = await helper.getData();
    for (var obj in data) {
      if (obj['upcoming']) {
        fList.add(obj);
      }
      if (!obj['upcoming']) {
        pList.add(obj);
      }
    }
  }

  List<dynamic> getFutureList() {
    return fList;
  }

  List<dynamic> getPastList() {
    return pList;
  }
}
