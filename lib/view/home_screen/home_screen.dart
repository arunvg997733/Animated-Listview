import 'package:animationtask/view/home_screen/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animationctr;
  late Animation heightanimation;
  late Animation fedanimation;
  bool open = false;

  @override
  void initState() {
    super.initState();

    animationctr = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150))
      ..addListener(() {
        setState(() {});
      });
    heightanimation = Tween(begin: .15, end: 0.53).animate(
        CurvedAnimation(parent: animationctr, curve: Curves.fastOutSlowIn));
    fedanimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationctr, curve: Curves.fastOutSlowIn));
  }

  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    final widthSize = MediaQuery.of(context).size.width;
    double height = heightanimation.value * heightSize * 1.5;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(
                height: height,
                heightSize: heightSize,
                fedanimation: fedanimation),
            MiddleTextWidget(heightSize: heightSize, open: open),
            ShowBottomWidget(
                heightSize: heightSize,
                height: height,
                widthSize: widthSize,
                open: open),
            VerticalListWidget(
                open: open, heightSize: heightSize, widthSize: widthSize),
            TopHeadingWidget(open: open),
            ContainerIconButton(
                widthSize: widthSize, fedanimation: fedanimation),
            CircleIconButton(widthSize: widthSize, open: open),
            IconButton(
                onPressed: () {
                  if (open == false) {
                    animationctr.forward();
                    open = true;
                  } else {
                    open = false;
                    animationctr.reverse();
                  }
                },
                icon: const Icon(
                  Icons.arrow_downward_outlined,
                  color: Colors.white,
                )),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
