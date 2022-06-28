import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Animasyonlar extends StatefulWidget {
  const Animasyonlar({Key? key}) : super(key: key);

  @override
  State<Animasyonlar> createState() => _AnimasyonlarState();
}

class _AnimasyonlarState extends State<Animasyonlar> {
  double opacitydegeri = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(title: Text("Animasyonlar")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (opacitydegeri == 0) {
                        opacitydegeri = 1;
                      } else {
                        opacitydegeri = 0;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.play_circle,
                  )),
              AnimatedOpacity(
                opacity: opacitydegeri,
                duration: Duration(seconds: 3),
                child: Container(width: 100, height: 100, color: Colors.amber),
              ),
              AnimateddContainer(),
              AnimatedOpacity(
                opacity: opacitydegeri,
                duration: Duration(seconds: 3),
                child: Container(width: 100, height: 100, color: Colors.amber),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (opacitydegeri == 0) {
                        opacitydegeri = 1;
                      } else {
                        opacitydegeri = 0;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.play_circle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class AnimateddContainer extends StatefulWidget {
  const AnimateddContainer({Key? key}) : super(key: key);

  @override
  State<AnimateddContainer> createState() => _AnimateddContainerState();
}

class _AnimateddContainerState extends State<AnimateddContainer> {
  bool secme = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          secme = !secme;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: secme ? 200.0 : 100.0,
          height: secme ? 100.0 : 200.0,
          color: secme ? Colors.cyan : Colors.amber,
          alignment: secme ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 75),
        ),
      ),
    );
  }
}
