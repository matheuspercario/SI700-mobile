import 'package:flutter/material.dart';

class NicolliScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //color: Colors.amber,
        margin: EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            photoWidget(),
            Divider(
              height: 10,
              thickness: 1.0,
            ),
            descriptionText(),
            Divider(
              height: 10,
              thickness: 1.0,
              indent: 30,
              endIndent: 30,
            ),
            informationText(),
          ],
        ),
      ),
    );
  }
}

Widget photoWidget() {
  return Container(
    width: double.infinity,
    height: 270.0,
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
                BoxShadow(blurRadius: 15, color: Colors.grey, spreadRadius: 3)
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.black87,
              radius: 72.0,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/vector_woman.jpg'),
                radius: 70.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "#nicolli",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                wordSpacing: 7,
                letterSpacing: 1.5,
                fontSize: 18.0,
                color: Colors.black),
          )
        ],
      ),
    ),
  );
}

Widget descriptionText() {
  return Container(
    padding: EdgeInsets.only(top: 30, bottom: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sobre ela',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26.0,
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "Este texto foi escrito por mim, Matheus Bruder.\n\nComo estou fazendo os trabalhos individualmente, decidi colocar minha namorada como segunda página, pois foi ela que me ajudou a pensar na ideia do trabalho da disciplina.\n\nComo eu sempre reclamava que não tinha um aplicativo bom para gerir minha finanças pessoais, minha namorada me sugeriu para criar um app cuja finalidade é ajudar a me organizar em relação aos ganhos e gastos do mês.",
          style: TextStyle(
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            wordSpacing: 5,
            letterSpacing: 1.0,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    ),
  );
}

Widget informationText() {
  return Container(
    padding: EdgeInsets.only(top: 30, bottom: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        info('Email', '-----------------------------------------------'),
        info('Aniversário', '15 Mar 2000'),
        info('Telefone', '+55 (14) 9 9999-9999'),
      ],
    ),
  );
}

Widget info(String title, String info) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$title',
        style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        '$info',
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
    ],
  );
}
