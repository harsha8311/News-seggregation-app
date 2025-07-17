import 'package:flutter/material.dart';

import 'CardBuilder.dart';
import 'Handlers/HeadLineHandler.dart';
import 'LoginScreen.dart';
import 'models/Headline.dart';

void main() {
  runApp(MaterialApp(home: const LoginScreen()));
  // runApp(MyApp());x
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Headline> positiveHeadlines = [];
  List<Headline> negativeHeadlines = [];
  List<Headline> neutralHeadlines = [];

  @override
  void initState() {
    super.initState();
    getHeadlines(); // Call getBlogs when the app starts
  }

  // Assuming `Headline` has a `sentiment` property.
  getHeadlines() async {
    var headlines = await HeadlineHandler().getHeadlines();
    // Clear the existing lists before categorizing
    positiveHeadlines.clear();
    negativeHeadlines.clear();
    neutralHeadlines.clear();

    for (var headline in headlines) {
      if (headline.sentiment == 'positive') {
        positiveHeadlines.add(headline);
      } else if (headline.sentiment == 'negative') {
        negativeHeadlines.add(headline);
      } else {
        neutralHeadlines.add(headline);
      }
    }

    // Call setState to update the UI after categorizing the headlines
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("News"),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Positive'),
                Tab(text: 'Negative'),
                Tab(text: 'Neutral'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildTabContent(positiveHeadlines),
              buildTabContent(negativeHeadlines),
              buildTabContent(neutralHeadlines),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              getHeadlines();
            },
            child: Icon(Icons.refresh),
          ),
        ),
      ),
    );
  }

  // Helper function to build the content for each tab
  Widget buildTabContent(List<Headline> headlines) {
    if (headlines.isEmpty) {
      return const Center(
          child:
              CircularProgressIndicator()); // Show loading indicator while fetching
    }

    return ListView.builder(
      itemCount: headlines.length,
      itemBuilder: (context, index) {
        return CardBuilder(
          title: headlines[index].title,
          cardId: headlines[index].id,
          colour: _getCardColorForSentiment(headlines[index].sentiment),
          url: headlines[index].url,
        );
      },
    );
  }

  // Helper function to get the card color based on sentiment
  Color _getCardColorForSentiment(String sentiment) {
    if (sentiment == 'positive') {
      return Colors.green;
    } else if (sentiment == 'negative') {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}
