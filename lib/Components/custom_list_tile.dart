import 'package:flutter/material.dart';

Widget customListTile({title, singer, cover, star, onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(bottom: 10, left: 15, right: 12, top: 15),
      child: Row(children: [
        Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(image: NetworkImage(cover))),
        ),
        SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22.5,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              singer,
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                for (var i = 0; i < star; i++)
                  new IconTheme(
                    data: new IconThemeData(color: Color.fromARGB(255, 252, 97, 97)),
                    child: new Icon(
                      Icons.star,
                      size: 20,
                    ), // I want to iterate this "star icon" for reviews.ratings.length times
                  ),
              ],
            )
          ],
        ),
      ]),
    ),
  );
}
