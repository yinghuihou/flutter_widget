import 'package:flutter/material.dart';
import 'package:flutter_widget/swiper/swiper.dart';

class SwiperDemo extends StatelessWidget {
  final _images = ["sea.png", "star.jpg", "cat.jpg", "horse.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swiper"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Swiper(
                  indicatorAlignment: AlignmentDirectional.bottomCenter,
                  speed: 500,
                  indicator: CircleSwiperIndicator(),
                  children: <Widget>[
                    Image.asset(
                      "assets/images/sea.png",
                      fit: BoxFit.fill,
                    ),
                    Image.asset("assets/images/star.jpg", fit: BoxFit.fill),
                    Image.asset(
                      "assets/images/cat.jpg",
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: SizedBox(
                  height: 200.0,
                  child: Swiper(
                    circular: true,
                    //reverse: true, //反向
                    indicator: RectangleSwiperIndicator(),
                    children: <Widget>[
                      Image.asset(
                        "assets/images/sea.png",
                        fit: BoxFit.fill,
                      ),
                      Image.asset("assets/images/star.jpg", fit: BoxFit.fill),
                      Image.asset(
                        "assets/images/cat.jpg",
                        fit: BoxFit.fill,
                      ),
                      Image.asset("assets/images/horse.jpg", fit: BoxFit.fill),
                      Image.asset(
                        "assets/images/road.jpg",
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: Swiper(
                  indicatorAlignment: AlignmentDirectional.topEnd,
                  circular: true,
                  indicator: NumberSwiperIndicator(),
                  children: <Widget>[
                    Image.asset(
                      "assets/images/sea.png",
                      fit: BoxFit.fill,
                    ),
                    Image.asset("assets/images/star.jpg", fit: BoxFit.fill),
                    Image.asset(
                      "assets/images/cat.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.asset("assets/images/horse.jpg", fit: BoxFit.fill),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: Swiper.builder(
                  indicatorAlignment: AlignmentDirectional.topEnd,
                  circular: true,
                  childCount: _images.length,
                  indicator: NumberSwiperIndicator(),
                  itemBuilder: (context, index) {
                    //print(index);
                    return Image.asset("assets/images/${_images[index]}",
                        fit: BoxFit.fill);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumberSwiperIndicator extends SwiperIndicator {
  @override
  Widget build(BuildContext context, int index, int itemCount) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.only(top: 10.0, right: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      child: Text("${++index}/$itemCount",
          style: TextStyle(color: Colors.white70, fontSize: 11.0)),
    );
  }
}
