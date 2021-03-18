/**
MATHEUS PERCÁRIO BRUDER
16/03/2021

SI700A - Dispositivos Móveis
Prof. Dr. Ulisses Dias
*/

// Função 01
int leastDifference(int a, int b, int c) {
  var sub_ab = a - b; // 13
  var sub_ac = a - c; // 11
  var sub_bc = b - c; // -2
  var seq = [sub_ab.abs(), sub_ac.abs(), sub_bc.abs()];
  var leastDifference = seq[0];

  for (var value in seq) {
    if (leastDifference > value) {
      leastDifference = value;
    }
  }

  return leastDifference;
}

// Função 02
int destruirPetecas(int numPetecas, int numAmigos) {
  return numPetecas % numAmigos;
}

// Função 03
void marteloThor(lst_thor, lst_hammer) {
  var x_thor = lst_thor[0];
  var y_thor = lst_thor[1];
  var x_hammer = lst_hammer[0];
  var y_hammer = lst_hammer[1];

  print("THOR INITIAL POSITION = [$x_thor, $y_thor]\n");

  var cont = 1;
  while (true) {
    // Descobrir o lado do passo
    if (x_hammer > x_thor) {
      x_thor++;
    } else {
      if (x_hammer < x_thor) {
        x_thor--;
      } else {
        if (y_hammer > y_thor) {
          y_thor++;
        } else {
          if (y_hammer < y_thor) {
            y_thor--;
          }
        }
      }
    }

    // Verificar se o THOR e o martelo estão juntos
    if ((x_thor == x_hammer) && (y_thor == y_hammer)) {
      print("STEP $cont -> [$x_thor, $y_thor]\n(THOR FOUND HAMMER!)");
      break;
    } else {
      print("STEP $cont -> [$x_thor, $y_thor]");
    }
    cont++;
  }
}

void main(List<String> args) {
  // 1)
  // print(leastDifference(1,5,9)); // 4
  // print(leastDifference(-1,15,3)); // 4
  // print(leastDifference(-101,15,99)); // 84
  // print(leastDifference(21,35,19)); // 2

  // 2)
  // print(destruirPetecas(23, 4)); // 3
  // print(destruirPetecas(35, 6)); // 5
  // print(destruirPetecas(95, 19)); // 0

  // 3)
  // marteloThor([5,2], [4,7]);
  // marteloThor([9, 7], [11, 3]);
  // marteloThor([5, 7], [-5, -3]);
}
