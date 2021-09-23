import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  bool which=false;
  double height=70;
  late AnimationController controller;
  late AnimationController controller1;

  @override
  void initState() {
    controller=AnimationController(vsync: this,duration: Duration(seconds: 4));
    controller1=AnimationController(vsync: this,duration: Duration(milliseconds: 600));
    controller.addListener(() {

      print(controller.value);
      if(controller.isCompleted){
        controller1.reverse();
        //height=70*controller.value;
      }
      setState(() {

      });
    });
    controller1.addListener(() {
      setState(() {
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller1.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              GestureDetector(
                onTap: (){
                  if(controller.value!=1){
                    controller1.forward();
                    Future.delayed(
                        Duration(milliseconds: 700),
                            (){
                          which=!which;
                          controller.forward();
                        }
                    );
                  }



                  setState(() {});
                },

                child: Container(
                  alignment: which?Alignment.centerLeft:Alignment.center,
                  width: controller.value!=1.0?250:150*(controller1.value)+100,
                  height: controller.value!=1.0?height*(1-controller1.value)+10:height*(1-controller1.value)+10,
                 child: which?Container(
                   width: 250*controller.value,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(7),
                     color: Colors.orange.shade800,
                   ),
                   child: controller.value==1?Text('Done',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),):SizedBox(),
                 )
                     :Text('download',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black87),),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.orange.shade200,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
