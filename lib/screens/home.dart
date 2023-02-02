import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:height_weight/constants/constants.dart';
import 'package:height_weight/widgets/left_bar.dart';
import 'package:height_weight/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightcontroller=TextEditingController();
  TextEditingController _widthcontroller=TextEditingController();
  double bmiresult=0;
  String _textresult="";

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexcolor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(controller:_heightcontroller,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: accentHexcolor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(controller: _widthcontroller,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: accentHexcolor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(onTap: () {
             double _h=double.parse(_heightcontroller.text);
              double _w=double.parse(_widthcontroller.text);
              setState(() {
                bmiresult=_w/(_h*_h);
                if(bmiresult>25){
                  _textresult="you are over weight";
                }
                if(bmiresult>=18.5&&bmiresult<=25){
                  _textresult="you are Normal weight";
                }
                else{
                  _textresult="you are under weight";
                }
              });
              
            },
              child: Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color:Colors.amber
                    ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                bmiresult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: accentHexcolor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(visible: _textresult.toString().isNotEmpty,
              child: Container(
                child: Text(
                  _textresult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color:Colors.blue),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 70),
            SizedBox(
              height: 50,
            ),
            RightBar(barWidth: 70)
          ],
        ),
      ),
    );
  }
}
