/**
MATHEUS PERCÁRIO BRUDER
16/03/2021

SI700A - Dispositivos Móveis
Prof. Dr. Ulisses Dias
*/

// Exercício 01
/* Bla bla bla... */

int leastAbsDifference(int a, int b, int c) {
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

void main(List<String> args) {
  print(leastAbsDifference(15, 2, 4) == 2);
  print(leastAbsDifference(-1, 9, -3) == 2);
}
