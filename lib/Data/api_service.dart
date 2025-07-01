import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Charector.dart';

Future<List<Character>> fetchCharector() async {
  final response = await http.get(Uri.parse('https://dragonball-api.com/api/characters'));

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    final List<dynamic> items = data['items'];

    return items.map((json) => Character.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load character data');
  }
}
