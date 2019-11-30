import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  
  final IconData icon;
  final String title;
  final String text;
  
  Topic({this.icon = Icons.arrow_right, this.title = 'New topic', this.text = ""});

  @override
  Widget build(BuildContext context) {
    return _buildTopic(icon, title, text);
  }

  _buildTopic(IconData icon, String title, String text) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    icon,
                    color: Colors.amber,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.amber),
                ),
              ],
            )),
        Container(
          padding: EdgeInsets.all(15.0),
          margin: EdgeInsets.only(bottom: 15.0),
          decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            text,
            style: TextStyle(fontSize: 18.0, color: Colors.black54,),
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}