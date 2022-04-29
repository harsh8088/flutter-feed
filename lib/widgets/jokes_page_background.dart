import 'package:flutter/material.dart';
import 'package:flutter_feed/tools/arc_clipper.dart';
import 'package:flutter_feed/ui_data.dart';

class JokesBackground extends StatelessWidget {
  final showIcon;
  final image;

  JokesBackground({this.showIcon = true, this.image});

  Widget topHalf(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Flexible(
      flex: 2,
      child: ClipPath(
        clipper: ArcClipper(),
        child: Stack(
          children: <Widget>[
             Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: UIData.kitGradients,
              )),
            ),
            showIcon
                ?  Center(
                    child: SizedBox(
                        height: deviceSize.height / 8,
                        width: deviceSize.width / 2,
                        child: FlutterLogo(
                            // colors: Colors.yellow,
                            )),
                  )
                : Container(
                    width: double.infinity,
                    child: image != null
                        ? Image.network(
                            image,
                            fit: BoxFit.cover,
                          )
                        : Container())
          ],
        ),
      ),
    );
  }

  final bottomHalf = Flexible(
    flex: 3,
    child: Container(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}
