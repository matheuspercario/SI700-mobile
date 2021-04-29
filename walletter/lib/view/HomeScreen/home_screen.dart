import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.greenAccent.shade700,
            ),
            Positioned(
              top: 120,
              child: myCard(),
            ),
          ],
        ),
        SizedBox(
          height: 150,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            add_income(),
            add_expense(),
          ],
        )
      ],
    );
  }

  Widget add_income() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/add_income');
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 40.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 10,
        primary: Colors.greenAccent.shade700,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget add_expense() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/add_expense');
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Icon(
          Icons.remove_rounded,
          color: Colors.white,
          size: 40.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 10,
        primary: Colors.redAccent.shade700,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20),
        ),
      ),
    );
  }

  Card myCard() {
    return Card(
      elevation: 10,
      child: Container(
        width: 350,
        height: 200,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: Text(
                  "Total",
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.monetization_on_rounded,
                      color: Colors.green,
                      size: 40.0,
                    ),
                    Text("         "),
                    Text(
                      "500,00",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      color: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
