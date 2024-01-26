//After adding the dependency that you want to use in pubspec.yaml under dependencies you use import
//The package material.dart in flutter is the one that contains the function runApp();
import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

const List<Color> gradientColors = [
  Color.fromARGB(255, 122, 175, 24),
  Color.fromARGB(255, 134, 82, 224)
];
//The main function is the main entry point of a dart file, it will be executed automatically when you app becomes active on a device
void main() {
  //This is a core function for dart apps, and is provided by the Flutter framework
  //Its main purpose is to show UI on the screen, it tells flutter what to dosplay on screen
  //runApp() function calls for an argument to be called, this will always be a Widget
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
            gradientColors), // Calling hotbrewed Container Widget
            // Could also use the predetermined GradientContainer.purpleHaze(),  for it to work with predetermined colors
      ),
    ),
  );
}

//Widgets are what you use to build the flutter UIs, and they are written always through code, these can be nested as needed
//and Flutter actually has many default ones ready to be used but also can be created if wished
//The same packaged that gives us runApp() also gives us access to the widgets available
//To add and create a widget in code you call the name of the widget and then open and close parentesis ie. MaterialApp()
//They are a construction function of a class
//MaterialApp() is a core widget that you will use in almost all flutter apps you develop as its the main widget that is used as a starting point which you call from the runApp() function
//It does a lot of behind the scenes setup work for the UI to be properly and correctly displayed on the screen
//Although on its own it doesn't show anything on the screen, you need to declare an argument for it
//MaterialApp() is defined as having input of named Parameters, like this void MaterialApp({name1, name2}){}, this means that it doesn't matter in what order you place your arguments instead you must use the name of the parameter to declare the argument

