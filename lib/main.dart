import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iecdfirst/bmi_app/first_screen.dart';
import 'package:iecdfirst/constants/colors.dart';
import 'package:iecdfirst/screens/messanger_screen.dart';
import 'package:iecdfirst/screens/stack_page_screen.dart';
import 'package:iecdfirst/screens/third_page_screen.dart';
import 'package:iecdfirst/shared/bloc_observer.dart';
import 'package:iecdfirst/shared/cach/cache_helper.dart';
import 'package:iecdfirst/shared/network/dio.dart';
import 'package:iecdfirst/shop_app/home_layout/cubit/cubit.dart';
import 'package:iecdfirst/shop_app/home_layout/home_layout_screen.dart';
import 'package:iecdfirst/shop_app/screens/auth/login_screen.dart';
import 'package:iecdfirst/shop_app/screens/on_board/on_board_screen.dart';

import 'constants/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CashHelper.init();
  DioNetwork.dioInit();
  token = CashHelper.getData(key: 'token') ?? '';
  print(token);
  Widget startWidget;
  if (token != '') {
    startWidget = HomeLayout();
  } else {
    startWidget = LoginScreen();
  }
  runApp(AllPage(startWidget: startWidget,));
}

class AllPage extends StatelessWidget {
  AllPage({Key? key, required this.startWidget}) : super(key: key);
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopAppCubit()..getHomeData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: Colors.grey.shade50,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.pinkAccent,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
            titleSpacing: 20,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.pinkAccent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          ),
          fontFamily: 'Jannah',
          textTheme: TextTheme(
          ),
        ),
        home: startWidget,
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'First Page',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        actions: [
          Center(child: Text("Skip")),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.access_alarm_rounded),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.red,
              child: Center(
                child: Text(
                  'Red',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.greenAccent,
              child: Center(
                child: Text(
                  'Green',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  'Yellow',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Blue',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        color: Colors.grey.shade300,
        child: Column(
          children: [
            Row(
              children: [
                buildImage(1),
                buildImage(2),
              ],
            ),
            Row(
              children: [
                buildImage(3),
                buildImage(4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildImage(int num) =>
    Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.black54),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Image.asset(
          'assets/images/$num.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );