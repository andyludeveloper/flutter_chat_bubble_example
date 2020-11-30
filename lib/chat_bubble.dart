import 'package:flutter/material.dart';

class ChatBubble extends CustomPainter {
  final Color color;
  final bool isMe;
  ChatBubble({this.color, this.isMe});

  var _radius = 10.0;
  var _x = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    // if (isMe) {
    //   canvas.drawRRect(
    //       RRect.fromLTRBAndCorners(0, 0, size.width - _x, size.height,
    //           bottomLeft: Radius.circular(_radius),
    //           bottomRight: Radius.circular(_radius),
    //           topRight: Radius.circular(_radius),
    //           topLeft: Radius.circular(_radius)),
    //       _paintColor(size));
    //
    //   canvas.clipPath(Path()
    //     ..moveTo(size.width, size.height / 3)
    //     ..lineTo(size.width - _x, size.height / 3)
    //     ..lineTo(size.width - _x, size.height / 3 + 10));
    //
    //   canvas.drawRect(
    //       Rect.fromLTRB(
    //         size.width - _x,
    //         0.0,
    //         size.width,
    //         size.height,
    //       ),
    //       _paintColor(size));
    // } else {
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(_x, 0, size.width, size.height,
            bottomLeft: Radius.circular(_radius),
            bottomRight: Radius.circular(_radius),
            topRight: Radius.circular(_radius),
            topLeft: Radius.circular(_radius)),
        _paintColor(size));

    final path = Path();
    path.moveTo(0, size.height / 3);
    path.lineTo(_x, size.height / 3);
    path.lineTo(_x, size.height / 3 + 10);
    canvas.clipPath(path);

    canvas.drawRect(
        Rect.fromLTRB(
          0.0,
          0.0,
          _x,
          size.height,
        ),
        _paintColor(size));
    // }
  }

  Paint _paintColor(Size size) {
    return Paint()
      ..color = this.color
      ..style = PaintingStyle.fill;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
