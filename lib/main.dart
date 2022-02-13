import 'package:flutter/material.dart';

void main() {
  runApp(AgeCalculatorApp());
}

class AgeCalculatorApp extends StatefulWidget {
  AgeCalculatorHome createState() => AgeCalculatorHome();
}

class AgeCalculatorHome extends State<AgeCalculatorApp> {
  TextEditingController yearController = new TextEditingController();
  TextEditingController monthController = new TextEditingController();
  TextEditingController dayController = new TextEditingController();

  String s1 = '0', s2 = '0', s3 = '0';

  void calcAge() {
    setState(() {
      print(yearController.value);
      int y = int.parse(yearController.text);
      int m = int.parse(monthController.text);
      int d = int.parse(dayController.text);
      int cy = DateTime.now().year;
      int cm = DateTime.now().month;
      int cd = DateTime.now().day;
      int yy, mm, dd;

      (cd < d) ? dd = 30 - (d - cd) : dd = cd - d;
      (cm < m) ? mm = 12 - (m - cm) : mm = cm - m;
      (cd < d) ? mm = mm - 1 : mm = mm;
      ((cm - m) != mm) ? yy = (cy - y - 1) : yy = cy - y;
      s1 = yy.toString();
      s2 = mm.toString();
      s3 = dd.toString();
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Age Calculator"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "Enter your birthday:",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 80,
                    child: TextField(
                      maxLength: 2,
                      controller: dayController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Day"),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 80,
                    child: TextField(
                      maxLength: 2,
                      controller: monthController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Month"),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 80,
                    child: TextField(
                      maxLength: 4,
                      controller: yearController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Year"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: 130),
                child: RaisedButton(
                  color: Colors.black,
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: calcAge,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Your Age:",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    s1 + " years",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    s2 + " months",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    s3 + " days",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
