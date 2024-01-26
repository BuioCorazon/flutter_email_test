import 'package:flutter/material.dart';

class TextWidgetPersonal extends StatelessWidget {
//Here inside the construction function is how you can assign Parameters for your class to receive input values
//Positional ones will come before the {} and Named Parameters will come inside the { , } and after the key, separating both named and positional by comas
//const TextWidgetPersonal(String positional,{super.key,named: int});
//After assigning Parameters for your class in the constructor function you must assign class variables, a sort of property to the class inside the class
//You can then connect them like const TextWidgetPersonal(String text,{super.key}):outputText = text; the : being the one telling the constructor to assign values, the first
//outputText variable referring to the class variable and the second one referring to the Parameter being assigned inside the constructor function
//But just as before like super.key this is a very unnecessary and verbose and therefore Dart gives us a shortcut because this is a very common pattern that you want to receive
//variables from outside the class so you instead use this.Parameter, mind you you must ensure that then the class variable has the same name as the Parameter inside the constructor
//function, and in this case you don't have to declare the Parameter type since you are declaring it for the class variable.
//And since now your class is no longer immutable and is receiving values from the outside you can no longer use const for it on the constructor function
//TextWidgetPersonal(this.text,{super.key});

//But in the case that you set the class variables that are receiving the arguments as final, you can then go back to setting the construction functions as const since they
//won't be changing internally
  const TextWidgetPersonal(this.text, {super.key});

//Also here is a good place to add final infront of the type NOT INSTEAD OF THE TYPE, since you still want to be clear about the type of argument that the class will be receiving,
//because you don't really plan on changing the value of the text once it's received, to make it clear that the variable will only be set once by the argument that is received
//String text; -> final String text;

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 104, 11, 42),
        fontSize: 28,
      ),
    );
  }
}
