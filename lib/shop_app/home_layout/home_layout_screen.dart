import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iecdfirst/shop_app/home_layout/cubit/cubit.dart';
import 'package:iecdfirst/shop_app/screens/home_screen.dart';

import 'cubit/state.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit=ShopAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Shop App'),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.index,
            onTap: (int value){
              cubit.changeIndex(value);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],

          ),
          body: cubit.screen[cubit.index],
        );
      },
    );
  }
}
