import 'package:flutter/material.dart';
import 'package:iecdfirst/constants/colors.dart';

class ResultScreen extends StatelessWidget {
   ResultScreen({Key? key, required this.result, required this.value, required this.advice}) : super(key: key);
   final String result;
   final String value;
   final String advice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Result',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: containerColor,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              result,
                              style: TextStyle(
                                fontSize: 32,
                                color: activeColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              value,
                              style: TextStyle(
                                  fontSize: 90,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              advice,
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        color: activeColor,
                        child: Text(
                          'RECALCULATE',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
