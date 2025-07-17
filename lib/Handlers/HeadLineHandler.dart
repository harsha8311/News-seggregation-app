import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // For date parsing

import '../models/Headline.dart';

class HeadlineHandler {
  List<Headline> allHeadlines = [];
  DateTime? lastFetchedTime;

  Future<List<Headline>> getHeadlines() async {
    try {
      // Fetch the last updated time from the server
      DateTime? lastUpdatedTime = await fetchLastUpdatedTime();

      // If headlines were fetched more than 1 hour ago or never fetched, refetch
      if (lastFetchedTime == null ||
          lastUpdatedTime == null ||
          lastUpdatedTime.difference(lastFetchedTime!).inHours >= 1) {
        allHeadlines = await fetchBlogs();
        lastFetchedTime = DateTime.now(); // Update the fetch time
      }
      return allHeadlines;
    } catch (e) {
      print('Error in getHeadlines: $e');
      return [];
    }
  }

  // Fetch blogs from the server and return a list of Headline objects
  static Future<List<Headline>> fetchBlogs() async {
    try {
      var url = Uri.parse('http://10.0.2.2:3000/headlines');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        // Process the data, ignoring null entries
        List<Headline> headlines = data
            .whereType<List>() // Filter for items that are lists
            .where((item) =>
                item != null && item.length >= 3) // Ensure valid entries
            .map((item) => Headline.fromJson({
                  'title': item[0] as String? ?? '', // Handle null title
                  'url': item[1] as String? ?? '', // Handle null URL
                  'id': 0, // Placeholder value for ID
                  'sentiment':
                      item[2] as String? ?? '', // Handle null sentiment
                }))
            .toList();
        return headlines;
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error in fetchBlogs: $e');
      return [];
    }
  }

  // Fetch the last updated time from the server
  static Future<DateTime?> fetchLastUpdatedTime() async {
    try {
      var url = Uri.parse('http://10.0.2.2:3000/last_updated');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('last_updated')) {
          // Parse the last_updated string into a DateTime object
          String lastUpdatedStr = data['last_updated'];
          return DateFormat('EEE MMM dd HH:mm:ss yyyy').parse(lastUpdatedStr);
        }
      } else {
        print(
            'Failed to fetch last updated time. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchLastUpdatedTime: $e');
    }
    return null;
  }
}
