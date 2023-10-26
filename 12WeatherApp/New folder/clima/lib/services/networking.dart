import 'package:http/http.dart' as http;
import 'dart:convert';

// get data
class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    // get current location data
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body; // JSON
      var decodeData = jsonDecode(data);

      return decodeData;
      /*    double temp = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];
      print(temp);*/
    }
  }
}
