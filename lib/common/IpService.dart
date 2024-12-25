import 'dart:convert';
import 'package:http/http.dart' as http;

class IpService {
  Future<String?> getUserIp() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.ipify.org?format=json'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data['ip'];
      } else {
        return null;
      }
    } catch (e) {
      print("Error getting IP: $e");
      return null;
    }
  }
}
