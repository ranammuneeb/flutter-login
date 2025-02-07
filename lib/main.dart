import 'package:flutter/material.dart';

void main() {
  runApp(const login());
}

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.grey),
      home: new loginpage(),
    );
  }
}


class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> with SingleTickerProviderStateMixin{

  late AnimationController _animatecontroller;
  late Animation<double> _animation;
  @override
  void initState(){
    super.initState();
    _animatecontroller=new AnimationController(vsync: this,
    duration: new Duration(milliseconds: 500)
    );
    _animation=new CurvedAnimation(parent: _animatecontroller,
        curve: Curves.easeInOutCubic);
    _animation.addListener(()=>this.setState(() {}));
    _animatecontroller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
              image:new AssetImage("assets/goku.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          Theme(
            data: new ThemeData(
              inputDecorationTheme: new InputDecorationTheme(
                labelStyle:
                new TextStyle(color: Colors.greenAccent, fontSize: 30.0),
              )
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // new FlutterLogo(
                //   size: _animation.value*90,
                //   curve: Curves.bounceInOut,
                // ),
                Image.asset(
                  'assets/logo.png',

                  width: _animation.value * 130, // Animated width
                  height: _animation.value * 130, // Animated height
                ),
                new Container(
                  padding: EdgeInsets.all(70.0),
                child: new Form(child:  Column(
                  children:<Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "enter email",
                        fillColor: Colors.white,
                        focusColor: Colors.white
                      ),
                      style: TextStyle(color: Colors.white,fontSize: 25),
                      keyboardType: TextInputType.emailAddress,

                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: "enter password",
                          fillColor: Colors.white
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(color: Colors.white,fontSize: 25),
                    ),
                    new ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.green,iconColor: Colors.white,shadowColor: Colors.teal),
                        child: new Icon(Icons.login_sharp))
            
                  ],
                )
                )
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}

