import 'package:flutter/material.dart';
import 'cards.dart';
import 'images.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  final GlobalKey _draggableKey = GlobalKey();
  Widget variableIconDog = Container();
  Widget variableIconCat = Container();
  Widget variableIconSpider = Container();

  @override
  Widget build(context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              width: 170,
              child: _buildDraggableImage(
                image: catImage,
              ),
            ),
            DragTarget(
              builder: (context, candidateItem, rejectedItem) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    dogCard,
                    variableIconDog,
                  ],
                ),
              ),
              onWillAccept: (data) => data == Key('dog'),
              onAccept: (item) {
                setState(() {
                  variableIconDog =
                      Icon(Icons.check_box_rounded, color: Colors.green);
                });
              },
              onLeave: (item) => setState(() {
                variableIconDog = Icon(Icons.cancel_rounded, color: Colors.red);
              }),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 170,
                child: _buildDraggableImage(
                  image: spiderImage,
                ),
              ),
              DragTarget(
                builder: (context, candidateItem, rejectedItem) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      catCard,
                      variableIconCat,
                    ],
                  ),
                ),
                onWillAccept: (data) => data == Key('cat'),
                onAccept: (item) {
                  setState(() {
                    variableIconCat =
                        Icon(Icons.check_box_rounded, color: Colors.green);
                  });
                },
                onLeave: (item) => setState(() {
                  variableIconCat =
                      Icon(Icons.cancel_rounded, color: Colors.red);
                }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 180,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: _buildDraggableImage(
                    image: dogImage,
                  ),
                ),
              ),
              DragTarget(
                builder: (context, candidateItem, rejectedItem) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      spiderCard,
                      variableIconSpider,
                    ],
                  ),
                ),
                onWillAccept: (data) => data == Key('spider'),
                onAccept: (item) {
                  setState(() {
                    variableIconSpider =
                        Icon(Icons.check_box_rounded, color: Colors.green);
                  });
                },
                onLeave: (item) => setState(() {
                  variableIconSpider =
                      Icon(Icons.cancel_rounded, color: Colors.red);
                }),
              ),
            ],
          )
        ],
      );

  Widget _buildDraggableImage({
    required Image image,
  }) {
    return LongPressDraggable<Key>(
      data: image.key,
      dragAnchor: DragAnchor.pointer,
      feedback: DraggingListItem(
        dragKey: _draggableKey,
        photoProvider: image.image,
      ),
      child: image,
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    Key? key,
    required this.dragKey,
    required this.photoProvider,
  }) : super(key: key);

  final GlobalKey dragKey;
  final ImageProvider photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
