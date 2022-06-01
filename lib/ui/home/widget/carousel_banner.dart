import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

class CarouselBanner extends StatefulWidget {
  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  final List<String> imageList = [
    "https://static.codingame.com/assets/background_03.42595ed3.jpg",
    "https://www.codingame.com/blog/wp-content/uploads/2016/12/fantastic_bits_ld.jpg",
    "https://static.codingame.com/servlet/fileservlet?id=55099444624408",
    "https://static.codingame.com/servlet/fileservlet?id=4669847904250",
    "https://www.codingame.com/blog/wp-content/uploads/2015/09/clash_of_code_logo_art.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return GFCarousel(
      items: imageList.map(
        (url) {
          return Container(
            margin: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
            ),
          );
        },
      ).toList(),
      autoPlay: true,
    );
  }
}
