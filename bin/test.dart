import 'dart:convert';

import 'package:http/http.dart' as http;

main() async {
  //var response = await http.get(Uri.parse("http://127.0.0.1:8000/wisha/a"));
  var response =
      await http.post(Uri.parse("http://127.0.0.1:8000/wisha/a"), body: {
    "username": "keiji",
    "email": "keijishinoda@gmail.com",
    "password": "matsuo283",
  });

  print(jsonDecode(response.body)["Username"]);
  print(jsonDecode(response.body)["email"]);
}
