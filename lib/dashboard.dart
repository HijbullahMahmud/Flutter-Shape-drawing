import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shape'),
      ),
      body: Center(
        child: ClipPath(
          clipper: BackgroundClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrangeAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              )
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    var roundFactor = 50.0;
    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundFactor);

    //bottom left
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(0, size.height, roundFactor, size.height);

    //bottom right
    path.lineTo(size.width - roundFactor, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - roundFactor);

    //top right
    path.lineTo(size.width, roundFactor * 2);
    path.quadraticBezierTo(size.width - 10, roundFactor, size.width - roundFactor * 1.5, roundFactor * 1.5);
    path.lineTo(roundFactor * 0.6, size.height * 0.33 - roundFactor * 0.3);
    path.quadraticBezierTo(0,size.height * 0.33, 0, size.height * 0.33 + roundFactor);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
