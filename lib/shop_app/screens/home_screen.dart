import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iecdfirst/shop_app/home_layout/cubit/cubit.dart';
import 'package:iecdfirst/shop_app/home_layout/cubit/state.dart';
import 'package:iecdfirst/shop_app/models/home_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);
        return ConditionalBuilder(
          condition: state is GetHomeDataSuccessState,
          builder: (BuildContext context) {
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(cubit.homeModel!.data!.products!.length,
                      (index) => buildGridItem(model:cubit.homeModel!.data!.products?[index])),
            );
          },
          fallback: (BuildContext context) {
            return Center(child: LinearProgressIndicator(color: Colors.pinkAccent,),);
          },
        );
      },
    );
  }
}

Widget buildGridItem({Products? model}) {
  return Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
          '${model!.image}',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 200,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.7),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Text(
                '${model.name}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            Icon(
              Icons.favorite,
              color: Colors.white,
              size: 35,
            )
          ],
        ),
      ),
    ],
  );
}
