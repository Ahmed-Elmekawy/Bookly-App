import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    logoAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              animationController.addListener(() {
                setState(() {});
              });
              return Image(
                image: const AssetImage(AssetsData.logo),
                width: sizeAnimation.value,
                color: colorAnimation.value,
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "browse free books",
            style: TextStyle(
                color: const Color(0xffA7A2A9).withOpacity(0.25),
                fontSize: 18,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  void logoAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    colorAnimation =
        ColorTween(begin: kGreyColor.withOpacity(0.25), end: kYellowColor)
            .animate(animationController);
    sizeAnimation =
        Tween<double>(begin: 200.0, end: 300.0).animate(animationController);
    animationController.forward();
  }

  Future<void> navigateToHome() {
    return Future.delayed(
      const Duration(seconds: 5),
      () {
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
