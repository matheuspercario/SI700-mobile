/**
MATHEUS PERCÁRIO BRUDER
16/03/2021

SI700A - Dispositivos Móveis
Prof. Dr. Ulisses Dias
*/

// Exercício 03
/* Bla bla bla... */

void thorHammer(lst_thor, lst_hammer) {
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
  List thor_position = [7, -1];
  List hammer_position = [5, -2];

  thorHammer(thor_position, hammer_position);
}
