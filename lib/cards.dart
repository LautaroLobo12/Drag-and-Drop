import 'package:flutter/material.dart';

final Widget dogCard = Card(
  elevation: 2,
  shadowColor: Colors.brown[200],
  child: const Padding(
    padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
    child: Text(
      'Dog',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ),
  ),
);

final Widget catCard = Card(
  elevation: 2,
  shadowColor: Colors.brown[200],
  child: const Padding(
    padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
    child: Text(
      'Cat',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ),
  ),
);

final Widget spiderCard = Card(
  elevation: 2,
  shadowColor: Colors.brown[200],
  child: const Padding(
    padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
    child: Text(
      'Spider',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ),
  ),
);
