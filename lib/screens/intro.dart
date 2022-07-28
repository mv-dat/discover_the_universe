import 'package:discover_the_universe/constant.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreenDefault extends StatefulWidget {
  IntroScreenDefault({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => IntroScreenDefaultState();
}

class IntroScreenDefaultState  extends State<IntroScreenDefault> {
  List<Slide> slides = Constant.slides;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: () { Navigator.pop(context); },
    );
  }
  
}