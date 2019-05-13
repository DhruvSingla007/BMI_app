import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new BodyMassIndex();
  }
}

class BodyMassIndex extends State<Home>{

  final TextEditingController _height = new TextEditingController();
  final TextEditingController _weight = new TextEditingController();
  final TextEditingController _age = new TextEditingController();

  double _BMIvalue;
  String _BMItext = "Please enter your details";

  String _BMIresult = 'See your result here';

  void _calculateBMI(){
    setState(() {
      double _heightInMeters = pow((double.parse(_height.text)*0.305),2);
      if(_height.text.isNotEmpty && _weight.text.isNotEmpty)
        _BMIvalue = double.parse(_weight.text)/_heightInMeters;

      if (_BMIvalue > 30.0){
        _BMIresult = "Obesity";
      } else if(_BMIvalue > 25.0 && _BMIvalue < 29.9){
        _BMIresult = "Overweight";
      } else if(_BMIvalue > 18.5 && _BMIvalue < 24.9){
        _BMIresult = "Normal";
      } else {
        _BMIresult = "Underweight";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "BMI",
          style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Image.asset('images/bmi.png',height: 90.0,),
            new Container(
              margin: new EdgeInsets.all(7.0),
              alignment: Alignment.center,
              height: 250.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Age',
                      icon: new Icon(Icons.person),
                    ),
                  ),
                  new TextField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Height',
                      hintText: 'in feet',
                      icon: new Icon(Icons.linear_scale),
                    ),
                  ),
                  new TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Weight',
                      hintText: 'in kgs',
                      icon: new Icon(Icons.line_weight),
                    ),
                  ),

                  new Container(
                    margin: new EdgeInsets.all(7.0),
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      color: Colors.pinkAccent,
                      onPressed: _calculateBMI,
                      textColor: Colors.white,
                      child: new Text(
                        'Calculate',
                      ),
                    ),
                  )
                ],
              ),
            ),

            new Padding(padding: EdgeInsets.all(5.0),),

            new Center(
              child:  new Text(
                _height.text.isNotEmpty && _weight.text.isNotEmpty ? 'BMI : ${_BMIvalue.toStringAsFixed(2)}' : '$_BMItext',
                style: new TextStyle(
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            new Padding(padding: EdgeInsets.all(7.0),),

            new Center(
              child:  new Text(
                 "$_BMIresult",
                style: new TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w800,
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}