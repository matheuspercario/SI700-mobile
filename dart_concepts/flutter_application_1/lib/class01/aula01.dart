// exercícios baseados em:
// https://edabit.com/

//////////////////////////////////////////////////
// crie uma função que retorne true e depois execute o seu
// código. esse passo inicial é apenas para você entender o que está
// acontecendo.
//////////////////////////////////////////////////
returnTrue(param) {
  return true;
}

//////////////////////////////////////////////////
// crie uma função que, dado um número, retorna true se ele ele é
// menor ou igual a zero.
//
// exemplo:
// 5  --> false
// 0  --> true
// -3 --> true
//
// você pode assumir que a função receberá um número. este exercício
// não está tentando pregar uma peça, ele é realmente fácil.
//////////////////////////////////////////////////
bool lessThanOrEqualToZero(num) {
  return num <= 0;
}

//////////////////////////////////////////////////
// crie uma função que recebe um número inteiro como parâmetro e
// retorna "even" para cada número par e "odd" para cada número ímpar.
//
// exemplo:
// 3   --> "odd"
//
// 146 --> "even"
//
// 19  --> "odd"
//
// retorne "even" ou "odd" com letras minúsculas.
//////////////////////////////////////////////////
String isEvenOrOdd(int num) {
  /*
  if (num % 2 == 0) {
    return "even";
  } else {
    return "odd";
  }*/
  return num % 2 == 0 ? "even" : "odd";
}

//////////////////////////////////////////////////
// crie uma função que recebe uma lista de números inteiros e retorna
// o menor número da lista.
//
// exemplo:
// [34, 15, 88, 2] --> 2
// [34, -345, -1, 100] --> -345
// [7, 7, 7] --> 7
//////////////////////////////////////////////////
findSmallestNumber(lst) {
  var smallest = lst[0];
  for (var i = 0; i < lst.length; i++) {
    if (lst[i] < smallest) {
      smallest = lst[i];
    }
  }
  return smallest;
}

//////////////////////////////////////////////////
// crie uma função que aceita uma lista e retorna o último elemento
// dessa lista.
//
// exemplo
// [1, 2, 3] --> 3
//
// ['a', 'b', 'c'] --> 'c'
//
// [true, false, true] --> true
//
// [7, 'string', false] --> false
//////////////////////////////////////////////////
getLastItem(lst) {
  return lst[lst.length - 1];
  //return lst.last;
}

//////////////////////////////////////////////////
// crie uma função que recebe uma lista de números e retorna o maior
// número na lista.
//
// exemplo:
//
// [4, 5, 1, 3] --> 5
//
//
// [1000, 1001, -857, 1] --> 1001
//////////////////////////////////////////////////
int findLargestNum(lst) {
  var largest = lst[0];
  //for (var i = 0; i < lst.length; i++) {
  for (var el in lst) {
    if (el > largest) {
      largest = el;
    }
  }
  return largest;
}

//////////////////////////////////////////////////
// escreva uma função que recebe uma lista de inteiros e retorna a
// soma dos valores absolutos de cada elemento da lista.
//
// exemplo:
//
// [2, -1, 4, 8, 10] --> 25
//
// [-3, -4, -10, -2, -3] --> 22
//
// [2, 4, 6, 8, 10] --> 30
//
// [-1] --> 1
//////////////////////////////////////////////////
computeAbsSum(lst) {
  var absSum = 0;
  lst.forEach((int v) {
    absSum += v.abs();
  });
  return absSum;
}

//////////////////////////////////////////////////
// crie uma função que recebe uma lista de listas com números (inteiros e reais)
// e retorne a soma dos maiores elementos de cada lista.
//
// exemplo:
//
// [[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]] --> [7, 90, 2] --> 99
//
// [[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]] --> [-34, -2, 7] --> -29
//
//////////////////////////////////////////////////
int findLargestNumsSum(List<List<int>> numList) {
  // var lst = new List();
  var soma = 0;
  for (var i = 0; i < numList.length; i++) {
    soma += findLargestNum(numList[i]);
  }
  return soma;
}

//////////////////////////////////////////////////
// Crie uma função que recebe uma string e devolve o número de
// palavras.
//
// Exemplo:
//
// "Apenas um exemplo de teste" --> 5
// "Isso é um teste" --> 4
// "Teste fácil" --> 2
//
// A maneira mais fácil de resolver esse problema é usando um método
// listado na Seção 6 da Cheat Sheet
//////////////////////////////////////////////////
getWordCount(txt) {
  return txt.split(" ").length;
}

//////////////////////////////////////////////////
// Crie uma função que recebe uma string e devolve o número de palavras com cinco letras.
//
// Exemplo:
// "vozes veladas veludosas vozes" --> {vozes} --> 1
// "joão amava teresa que amava raimundo que amava maria" --> {João, Maria} --> 2
//////////////////////////////////////////////////
getFiveLetters(txt) {
  List palavras = txt.split(" ");
  Set sacoPalavras = new Set();

  for (var palavra in palavras) {
    if (palavra.length == 5) {
      sacoPalavras.add(palavra);
    }
  }
  return sacoPalavras.length;
}

//////////////////////////////////////////////////
// Crie uma função que recebe uma string e verifica se tem o número de
// 'x's igual ao número de 'o's. A sua função retornará "True" ou
// "False".
//
// Exemplo:
//
// "ooxx" --> True
//
// "xooxx" --> False
//
// "ooxxm" --> True
//
// "zpzpzpp" --> True
//
// "zzoo" --> False
//////////////////////////////////////////////////
xo(text) {
  var xo = {};
  text.runes.forEach((character) {
    String char = String.fromCharCode(character);
    xo[char] ??= 0;
    xo[char] += 1;
  });
  return xo["x"] == xo["o"];
}

bool allElementsDifferent(lst) {
  var keyCount = {};
  lst.forEach((v) {
    keyCount[v] ??= 0;
    keyCount[v] += 1;
  });

  var valueRepetition = {};

  for (var v in keyCount.values) {
    if (valueRepetition[v] == null) {
      valueRepetition[v] = 0;
    } else {
      return false;
    }
  }
  return true;
}

//////////////////////////////////////////////////
///// Função Principal
//////////////////////////////////////////////////
void main() {
  print(returnTrue(null));
  print(lessThanOrEqualToZero(10) == false);
  print(isEvenOrOdd(10) == "even");
  print(findSmallestNumber([5, 2, 9]) == 2);
  print(getLastItem(["a", 1, true]) == true);
  print(findLargestNum([5, 2, 9]) == 9);
  print(computeAbsSum([5, -2, 9]) == 16);
  print("ULISSES");
  print(findLargestNumsSum([
        [5, 2, 9],
        [4, 0],
        [7, 10, 3]
      ]) ==
      23);
  print(getWordCount("eu sou a luz das estrelas") == 6);
  print(getFiveLetters("Amo te tanto meu amor não cante tanto") == 2);
  print(xo("xingxaoxango") == false);
  print(allElementsDifferent([1, 1, 1, "2", "2", 3]) == true);
  print(allElementsDifferent([1, 1, 1, "2", "2", 3, 3]) == false);
}
