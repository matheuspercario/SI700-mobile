import 'package:flutter/material.dart';

class MatheusScreen extends StatelessWidget {
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
                backgroundImage:
                    AssetImage('assets/images/profile_picture_cropped.jpg'),
                radius: 70.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "#matheusbruder",
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
          'Sobre mim',
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
          "Olá! Meu nome é Matheus Percário Bruder, tenho 22 anos de idade e estou cursando Sistemas de Informação na Faculdade de Tecnologia da Unicamp de Limeira.\n\nJá aviso de antemão que não tenho muita experiência com UI/UX, portanto, certamente alguns projetos vão acabar ficando 'feios'. Eu gosto mesmo é do back-end e dos dados, pretendo seguir carreira como Cientista de dados, contudo, atualmente estou estagiando na área de automação de processos na Bosch (Campinas-SP).\n\nEste é um aplicativo foi desenvolvido para disciplina de dispositivos móveis e nas outras abas você pode encontrar mais informações sobre o projeto que pretendo desenvolver durante a disciplina.",
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
        info('Email', 'matheuspercario@gmail.com'),
        info('Aniversário', '24 Mar 1999'),
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
