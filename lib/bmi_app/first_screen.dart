import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iecdfirst/bmi_app/calculator_brain.dart';
import 'package:iecdfirst/bmi_app/cubit/cubit.dart';
import 'package:iecdfirst/bmi_app/cubit/state.dart';
import 'package:iecdfirst/bmi_app/result_screen.dart';
import 'package:iecdfirst/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BMICubit(),
      child: BlocConsumer<BMICubit,BMIState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit=BMICubit.get(context);
          return Scaffold(
            backgroundColor: darkColor,
            appBar: AppBar(
              backgroundColor: darkColor,
              title: Text('BMI CALCULATER'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        genderItemWidget(
                          icon: FontAwesomeIcons.mars,
                          text: 'Male',
                          genderDetermine: () {
                            // setState(() {
                            //   isMale = true;
                            // });
                            cubit.changeGender(true);
                          },
                          color: cubit.isMale ? activeColor : containerColor,
                        ),
                        genderItemWidget(
                          icon: FontAwesomeIcons.venus,
                          text: 'Female',
                          genderDetermine: () {
                            // setState(
                            //       () {
                            //     isMale = false;
                            //   },
                            // );
                            cubit.changeGender(false);
                          },
                          color: cubit.isMale ? containerColor : activeColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: containerColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: TextStyle(fontSize: 22, color: textColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${cubit.height.round()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 70,
                                  color: Colors.white),
                            ),
                            Text(
                              'cm',
                              style: TextStyle(fontSize: 22, color: textColor),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: textColor,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15,
                              elevation: 10,
                            ),
                            thumbColor: activeColor,
                            overlayColor: overlayColor,
                          ),
                          child: Slider(
                              min: 50,
                              max: 250,
                              value: cubit.height,
                              onChanged: (value) {
                                // setState(() {
                                //   height = value;
                                // });
                                cubit.changeHeight(value);
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        bottomItemWidget(
                            text: 'Weight',
                            num: cubit.weight,
                            onAdd: () {
                              // setState(() {
                              //   weight++;
                              // });
                              cubit.changeWeightPlus();
                            },
                            onRemove: () {
                              // setState(() {
                              //   weight--;
                              // });
                              cubit.changeWeightMinus();
                            }),
                        bottomItemWidget(
                            text: 'Age',
                            num: cubit.age,
                            onAdd: () {
                              // setState(() {
                              //   age++;
                              // });
                              cubit.changeAgePlus();
                            },
                            onRemove: () {
                              // setState(() {
                              //   age--;
                              // });
                              cubit.changeAgeMinus();
                            }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      var cal = CalculatorBrain(cubit.height.toInt(), cubit.weight);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            value: cal.calculateBMI(),
                            result: cal.getResult(),
                            advice: cal.getInterpretation(),
                          ),
                        ),
                      );
                    },
                    color: activeColor,
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget heightWidget(context, cubit) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: containerColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Height',
              style: TextStyle(fontSize: 22, color: textColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${cubit.height.round()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                      color: Colors.white),
                ),
                Text(
                  'cm',
                  style: TextStyle(fontSize: 22, color: textColor),
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: textColor,
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 15,
                  elevation: 10,
                ),
                thumbColor: activeColor,
                overlayColor: overlayColor,
              ),
              child: Slider(
                  min: 50,
                  max: 250,
                  value: cubit.height,
                  onChanged: (value) {
                    // setState(() {
                    //   height = value;
                    // });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomWidget(cubit) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Row(
          children: [
            bottomItemWidget(
                text: 'Weight',
                num: cubit.weight,
                onAdd: () {
                  // setState(() {
                  //   weight++;
                  // });
                },
                onRemove: () {
                  // setState(() {
                  //   weight--;
                  // });
                }),
            bottomItemWidget(
                text: 'Age',
                num: cubit.age,
                onAdd: () {
                  // setState(() {
                  //   age++;
                  // });
                },
                onRemove: () {
                  // setState(() {
                  //   age--;
                  // });
                }),
          ],
        ),
      ),
    );
  }

  Widget bottomItemWidget(
      {required String text,
      int? num,
      Function()? onRemove,
      Function()? onAdd}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: containerColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 22,
                color: textColor,
              ),
            ),
            Text(
              '$num',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: textColor,
                  onPressed: onRemove,
                  child: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  backgroundColor: textColor,
                  onPressed: onAdd,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget genderWidget(cubit) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Row(
          children: [
            genderItemWidget(
              icon: FontAwesomeIcons.mars,
              text: 'Male',
              genderDetermine: () {
                // setState(() {
                //   isMale = true;
                // });
              },
              color: cubit.isMale ? activeColor : containerColor,
            ),
            genderItemWidget(
              icon: FontAwesomeIcons.venus,
              text: 'Female',
              genderDetermine: () {
                // setState(
                //       () {
                //     isMale = false;
                //   },
                // );
              },
              color: cubit.isMale ? containerColor : activeColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget genderItemWidget(
      {required IconData icon,
      Color? color,
      Function()? genderDetermine,
      required String text}) {
    return Expanded(
      child: GestureDetector(
        onTap: genderDetermine,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 80,
                color: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 22,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
