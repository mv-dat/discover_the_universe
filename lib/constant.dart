import 'dart:ui';

import 'package:intro_slider/slide_object.dart';

class Constant {
  static List<Slide> slides = [
    Slide(
      title: "Sun",
      description:
      "The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma",
      pathImage: "images/mat-troi.png",
      backgroundColor: const Color(0xff000000)
    ),
    Slide(
      title: "Exploration of Jupiter",
      description:
      "The exploration of Jupiter has been conducted via close observations by automated spacecraft",
      pathImage: "images/sao-moc.png",
      backgroundColor: const Color(0xfff5a623),
    ),
    Slide(
      title: "Mercury (planet)",
      description:
      "Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days",
      pathImage: "images/sao-thuy.png",
      backgroundColor: const Color(0xff35ff00),
    ),
    Slide(
      title: "Pluto",
      description:
      "Pluto (minor-planet designation: 134340 Pluto) is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune",
      pathImage: "images/sao-diem-vuong.png",
      backgroundColor: const Color(0xff0078ff),
    ),
    Slide(
      title: "Earth",
      description:
      "Earth is the third planet from the Sun and the only astronomical object known to harbor life",
      pathImage: "images/trai-dat.png",
      backgroundColor: const Color(0xff00ffaa),
    )
  ];
}