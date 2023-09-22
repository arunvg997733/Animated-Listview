import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MiddleTextWidget extends StatelessWidget {
  const MiddleTextWidget({
    super.key,
    required this.heightSize,
    required this.open,
  });

  final double heightSize;
  final bool open;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      bottom: heightSize * 0.3,
      child: open == true
          ? const SizedBox()
          : AnimationConfiguration.synchronized(
              child: SlideAnimation(
                verticalOffset: -50,
                duration: const Duration(milliseconds: 700),
                child: FadeInAnimation(
                  duration: const Duration(milliseconds: 700),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green),
                        child: const Center(
                          child: Text(
                            "ON SALE",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Text('Eiffel Tower',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      const Text('Paris,France',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.widthSize,
    required this.open,
  });

  final double widthSize;
  final bool open;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: widthSize * 0.42,
      child: AnimatedScale(
        scale: open == false ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: const CircleAvatar(
          backgroundColor: Colors.blueGrey,
          radius: 30,
          child: Icon(Icons.flight),
        ),
      ),
    );
  }
}

class ContainerIconButton extends StatelessWidget {
  const ContainerIconButton({
    super.key,
    required this.widthSize,
    required this.fedanimation,
  });

  final double widthSize;
  final Animation fedanimation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widthSize * 0.05,
      bottom: 30,
      child: Transform.scale(
        alignment: Alignment.bottomCenter,
        scale: fedanimation.value,
        child: Container(
          height: 50,
          width: widthSize * 0.9,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 110, 110, 110),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.flight,
                color: Colors.white,
              ),
              const Text(
                "SEARCH FLIGHT",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green),
                child: const Center(
                    child: Text("ON SALE",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopHeadingWidget extends StatelessWidget {
  const TopHeadingWidget({
    super.key,
    required this.open,
  });

  final bool open;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: open,
      child: const Align(
          alignment: Alignment.topCenter,
          child: AnimationConfiguration.staggeredList(
            position: 1,
            child: SlideAnimation(
              verticalOffset: 30,
              duration: Duration(milliseconds: 700),
              child: FadeInAnimation(
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 700),
                child: SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text('Eiffel Tower',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('Paris,France',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    )),
              ),
            ),
          )),
    );
  }
}

class VerticalListWidget extends StatelessWidget {
  const VerticalListWidget({
    super.key,
    required this.open,
    required this.heightSize,
    required this.widthSize,
  });

  final bool open;
  final double heightSize;
  final double widthSize;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // top: open == true ? 120:230,
      top: open == true ? heightSize * .17 : heightSize * .15,
      child: SizedBox(
          height: 100,
          width: widthSize,
          child: SingleChildScrollView(
            physics: open == true
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  10,
                  (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300 + (index * 100)),
                        // transform: Matrix4.translationValues(0,!open ?0:-290,0),
                        transform: Matrix4.translationValues(
                            0, !open ? heightSize * .6 : 0, 0),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 100,
                        width: 90,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(
                                    10,
                                    10,
                                  ),
                                  color: Colors.grey,
                                  blurRadius: 10)
                            ],
                            image: const DecorationImage(
                                image: AssetImage('assets/eiffeltower.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      )),
            ),
          )),
    );
  }
}

class ShowBottomWidget extends StatelessWidget {
  const ShowBottomWidget({
    super.key,
    required this.heightSize,
    required this.height,
    required this.widthSize,
    required this.open,
  });

  final double heightSize;
  final double height;
  final double widthSize;
  final bool open;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, heightSize - height - 60),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: heightSize,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Divider(
                    thickness: 4,
                    endIndent: widthSize * .45,
                    indent: widthSize * .45,
                  ),
                  SizedBox(
                    height: heightSize * 0.17,
                  ),
                  open == true
                      ? const AnimationConfiguration.synchronized(
                          child: SlideAnimation(
                              duration: Duration(milliseconds: 400),
                              verticalOffset: 100,
                              child: FadeInAnimation(
                                  duration: Duration(seconds: 1),
                                  child: Text(
                                      "Paris, France's capital, is a major European city and a global center for art, fashion, gastronomy and culture. Its 19th-century cityscape is crisscrossed by wide boulevards and the River Seine."))))
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  open == true
                      ? const AnimationConfiguration.synchronized(
                          child: SlideAnimation(
                              duration: Duration(milliseconds: 400),
                              verticalOffset: 100,
                              child: FadeInAnimation(
                                  duration: Duration(seconds: 1),
                                  child: Text(
                                    "READ MORE",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ))))
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  open == true
                      ? AnimationConfiguration.synchronized(
                          child: SlideAnimation(
                            duration: const Duration(milliseconds: 700),
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      image:
                                          AssetImage('assets/eiffeltower.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  open == true
                      ? const AnimationConfiguration.synchronized(
                          child: SlideAnimation(
                              duration: Duration(milliseconds: 700),
                              child: Row(
                                children: [
                                  Text(
                                    "Top Sight",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ],
                              )),
                        )
                      : const SizedBox(),
                  open == true
                      ? Column(
                          children: List.generate(
                              10,
                              (index) => AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 800),
                                    child: SlideAnimation(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: widthSize * 0.4,
                                              height: widthSize * 0.2,
                                              decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/eiffeltower.jpg'),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              width: widthSize * 0.4,
                                              height: widthSize * 0.2,
                                              child: const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Musee du Louvre',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  Text(
                                                    'Top choice museum in Louvre & Les Halles',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.height,
    required this.heightSize,
    required this.fedanimation,
  });

  final double height;
  final double heightSize;
  final Animation fedanimation;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -height),
      child: Container(
        width: double.infinity,
        height: heightSize,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/eiffeltower.jpg'),
                fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: fedanimation.value * 10, sigmaY: fedanimation.value * 10),
          child: Container(),
        ),
      ),
    );
  }
}
