/**
MATHEUS PERCÁRIO BRUDER (INDIVIDUAL)
16/03/2021

SI700A - Dispositivos Móveis
Prof. Dr. Ulisses Dias
*/

// Função 01
int leastDifference(int a, int b, int c) {
  var seq = [(a - b).abs(), (a - c).abs(), (b - c).abs()];
  var leastDiff = seq[0];

  for (var value in seq) {
    if (leastDiff > value) {
      leastDiff = value;
    }
  }

  return leastDiff;
}

// Função 02
int destruirPetecas(int numPetecas, int numAmigos) {
  return numPetecas % numAmigos;
}

// Função 03
void marteloThor(thor, martelo) {
  var x_thor = thor[0];
  var y_thor = thor[1];
  var x_mart = martelo[0];
  var y_mart = martelo[1];

  var positions = [thor];
  print("THOR INITIAL POSITION = ${positions.single}\n");

  var cont = 1;
  while (true) {
    // Descobrir o lado do passo
    if (x_mart > x_thor) {
      x_thor++;
    } else {
      if (x_mart < x_thor) {
        x_thor--;
      } else {
        if (y_mart > y_thor) {
          y_thor++;
        } else {
          if (y_mart < y_thor) {
            y_thor--;
          }
        }
      }
    }

    // Adicionar ao percurso
    positions.add([x_thor, y_thor]);

    // Verificar se o THOR e o martelo estão juntos
    if (positions.last.toString() == martelo.toString()) {
      print("STEP $cont -> ${positions.last} \n(THOR FOUND HAMMER!)");
      break;
    } else {
      print("STEP $cont -> ${positions.last}");
    }
    cont++;
  }
}

void main(List<String> args) {
  // // 1)
  // print(leastDifference(1, 5, 9)); // 4
  // print(leastDifference(-1, 15, 3)); // 4
  // print(leastDifference(-101, 15, 99)); // 84
  // print(leastDifference(21, 35, 19)); // 2

  // // 2)
  // print(destruirPetecas(23, 4)); // 3
  // print(destruirPetecas(35, 6)); // 5
  // print(destruirPetecas(95, 19)); // 0

  // 3)
  marteloThor([5, 2], [4, 7]);
}
