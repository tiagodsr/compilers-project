// exemplo a demonstrar a analise semântica

fun main() {
    var x = 5;
    y = 5;
    val z = -(x+y);
    if (x == y) {
        print("x é igual y");
    } 
    else {
        print("x é diferente de y  ");
    }
    print(z);
}

// variable not defined z - CodeGen