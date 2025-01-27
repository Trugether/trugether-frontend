import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:trugether_frontend/explore/dto/dataconvert.dart';

class ApiService {
  String apiUrl = "https://saavn.dev/api/search/songs?query=";
  late String query;

  ApiService(this.query) {
    // URL encode the query to handle spaces and special characters
    apiUrl = "$apiUrl${Uri.encodeComponent(query)}";
  }

  Future<SongResponse> fetchSongs() async {
    try {
      // Print out the API URL before sending the request
      print('Fetching songs from: $apiUrl');

      final response = await http.get(Uri.parse(apiUrl));

      // Check and print the status code and body to debug the response
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return SongResponse.fromJson(jsonData);
      } else {
        throw Exception("Failed to fetch songs: ${response.statusCode}");
      }
    } catch (e) {
      print('Error during API request: $e');
      throw Exception("Error: $e");
    }
  }
}
