import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            initialPhoto(),
            Divider(
              height: 70,
              indent: 100,
              endIndent: 100,
            ),
            descriptionText(),
          ],
        ),
      ),
    );
  }
}

Widget initialPhoto() {
  return Container(
    decoration: BoxDecoration(color: Colors.green),
    child: Container(
      width: double.infinity,
      height: 350.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: CircleAvatar(
              child: Image.asset(
                'assets/images/wallet_copia.png',
                width: 200,
              ),
              backgroundColor: Colors.green[800],
              radius: 120.0,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget descriptionText() {
  return Container(
    margin: EdgeInsets.only(left: 30, right: 30, bottom: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Walletter',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Text(
          'Walletter é um aplicativo de cunho financeiro, no qual você conseguirá adicionar e remover seus ganhos e suas despesas mensais, bem como, visualizar seu balanço mensalmente. O nome do aplicativo surgiu da junção das palavras "Flutter" e "Wallet" e, a ideia inicial é armazenar todos os dados em nuvem.\n\nO intuito é que o Walletter seja bastante simples, isto é, cada usuário vai possuir uma conta, assim sendo, poderá inserir ou remover ganhos e gastos, assim como, a data de cada transação. Então, o próprio aplicativo vai identificar os ganhos e gastos do determinado mês, fazer o balanço e o mostrar na tela principal.\n\nAinda não sabe-se ao certo, mas o objetivo é possuir poucas telas e com rápidos cliques encontrar tudo o que precisa em relação a sua saúde financeira mensal.',
          style: TextStyle(
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.justify,
        ),
        Divider(
          height: 70,
          indent: 100,
          endIndent: 100,
        ),
        Text(
          'Outras informações',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "0 - Tela de registro;\n1 - Tela de login;\n2 - Tela principal (balanço);\n3 - Tela inserção ganhos/gastos;\n4 - Tela remoção ganhos/gastos;\n5 - Dados armazenados em nuvem.",
          style: TextStyle(
            fontSize: 18.0,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    ),
  );
}
