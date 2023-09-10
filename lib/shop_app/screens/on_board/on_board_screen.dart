import 'package:flutter/material.dart';
import 'package:iecdfirst/shop_app/screens/auth/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'on_board_model.dart';

class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({Key? key}) : super(key: key);
  PageController pageController = PageController();
  int pageIndex = 0;
  List<OnBoardModel> onBoardList = [
    OnBoardModel(
        tittle: 'Tittle one',
        subTittle: 'SubTittle one !!',
        image: 'onboard_1.png'),
    OnBoardModel(
        tittle: 'Tittle two',
        subTittle: 'SubTittle two !!',
        image: 'onboard_1.png'),
    OnBoardModel(
        tittle: 'Tittle three',
        subTittle: 'SubTittle three !!',
        image: 'onboard_1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginScreen()),
                    (route) => false,
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 18,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
                pageIndex = index;
              },
              controller: pageController,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => pageViewItem(onBoardList[index]),
              itemCount: onBoardList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SmoothPageIndicator(
                    effect: SwapEffect(
                        dotHeight: 10,
                        dotWidth: 15,
                        type: SwapType.yRotation,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.pinkAccent),
                    controller: pageController,
                    count: onBoardList.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (pageIndex == onBoardList.length - 1)
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false,
                      );
                    pageController.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeOutQuad);
                  },
                  backgroundColor: Colors.pinkAccent,
                  child: Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget pageViewItem(OnBoardModel model) {
  return Column(
    children: [
      Expanded(
        child: Image.asset('assets/images/${model.image}'),
      ),
      Text(
        '${model.tittle}',
        style: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '${model.subTittle}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
