import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            photoWidget(),
            logoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/');
      },
      child: Text(
        "Logout",
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 5,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        primary: Colors.grey.shade300,
      ),
    );
  }

  Widget userName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "User: ",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "Nicollinha boboca",
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  Widget photoWidget() {
    return Container(
      width: double.infinity,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.shade900,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.greenAccent.shade700,
                radius: 72.0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: Image.asset(
                    'assets/images/user-icon.png',
                    width: 70,
                  ),
                  radius: 70.0,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            userName(),
          ],
        ),
      ),
    );
  }
}
