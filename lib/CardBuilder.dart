import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardBuilder extends StatefulWidget {
  final String title;
  final int cardId;
  final String url;
  final Color colour;

  CardBuilder(
      {Key? key,
      required this.title,
      required this.cardId,
      required this.colour,
      required this.url})
      : super(key: key);

  @override
  State<CardBuilder> createState() => _CardBuilderState();
}

class _CardBuilderState extends State<CardBuilder> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      elevation: 5,
      color: widget.colour,
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  var url = widget.url;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text("Read Full Article"),
              )
            ],
          )
        ],
      ),
    );
  }
}
