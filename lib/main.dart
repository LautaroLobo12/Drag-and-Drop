import 'package:flutter/material.dart';
import 'body.dart';

void main() {
  runApp(
    MaterialApp(
      home: const DragnDrop(),
    ),
  );
}

@immutable
class DragnDrop extends StatefulWidget {
  const DragnDrop({Key? key}) : super(key: key);

  @override
  _DragnDropState createState() => _DragnDropState();
  initState() {}
}

class _DragnDropState extends State<DragnDrop> with TickerProviderStateMixin {
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Drag\'nDrop!',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          elevation: 1,
          backgroundColor: Colors.greenAccent,
        ),
        body: Body(),
      );
}
