import 'dart:math';

import 'package:http/http.dart' as http;

class ServiceFood {
  static loadmain() async {
    try {
      var variable = generateRandomString(1);

      var request = http.Request('GET',
          Uri.parse('http://www.themealdb.com/api/json/v1/1/search.php?f=$variable'));

      http.StreamedResponse response = await request.send();

      var jsonData = await response.stream.bytesToString();

      return jsonData;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  static generateRandomString(int length) {
    final random = Random();
    const availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    final randomString = List.generate(length,
            (index) => availableChars[random.nextInt(availableChars.length)])
        .join();

    return randomString;
  }
}
