// import 'dart:html';

import 'package:first_app/button_container_web.dart';
import 'package:flutter/material.dart';
import 'package:first_app/button_container.dart';
// Comment the text_container widget import since its no longer being used
import 'package:first_app/text_container.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

// import 'package:flutter_email_sender/flutter_email_sender.dart';

//Be mindful that you can't introduce variables inside constants, const function() | const Widget(), since it won't work because variables can change at any point and the point of
//using const is to reuse the results of code that won't change, but in instances like hardcoded data like the colors: [] list that is being used inside LinearGradient can always
//be optimized by const
//
//When declaring variables you can either use var and then assign a type by inferring it when you declare its value like with startAlignment
//or you can assign it by writing the type that you want the variable to be instead of var, like double, int, string, etc. But if you aren't going to declare a value while
//declaring the variable you should put a ? right after writing the type of variable, to make it clear that the variable is either that type or null so that it's optional whether
//the variable is set or not incase it ends up not being used
//
//There are 2 special types of variables that being const and final
//If you know that you are never going to change the value of a variable you should use final, since when working in teams this way you ensure that your coworkers won't end up
//changing them and potentially breaking the code, its good to be as restrictive as possible to ensure other's wont reassign the values of variables you are working with
//
//final startAlignment = Alignment.topLeft;
//
//const is almost the same as final, but const also provides some extra information to Dart when used on the left side of = when declaring the variable it tells that the value on
//the right is a compiled type constant, meaning it's simply locked in at the point of time this code is compiled, when the value is hardcoded theres no difference from final but
//when talking about declaring a const variable the return value of a function means that that function must be executed when the app runs to get the actual value SO you can't
//actually use const type variables for function values since for const the value must be already there before the application is run, in that case you must use final for function
//values.
//
//const startAlignment = Alignment.topLeft;
//final startAlignment = potentialFunction();
//
//So if you change var type variables to const type variables whenever possible that means you can actually use them inside const Widgets for performance optimization

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

double? yiiipe;

//When creating a class you must first as good practice name it with an Upper case letter at the beginning, and since classes can inherit from other classes, you do so by
//using the keyword 'extends' followed by the name of the class from which you want to inherit, inheriting from another class can add a lot of data and logic from the other class
//
class GradientContainer extends StatelessWidget {
  //Here what im doing is initializing the GradientContainer class by essentialy constructing my custom class, this is done by forwarding a key variable that is required by all classes inheriting from StatelessWidget, this can be done 2 ways
  //one is by doing something like 'GradientContainer({key}): super(key: key);' the keyword super here would be the one forwarding my own class named parameter key that I defined first  by placing it under StatelessWidget key that is being called by super(key: )
  //The other way is way more simple and straight forward and you just forward it directly while you are defining it like below

  // You should be also aware that in this case for the Widget class the colorado Parameter is obligatory for the class widget to function so usually a positional parameter is going to be
  // more at hand to be used, but it can also be coded to be a named parameter, if you code it a such theres going to be an error because named parameters are optional by default, this can be
  // solved simply by adding the 'required' keyword for it to become obligatory at the moment you wish to call upon the widget

  const GradientContainer(this.colorado, {super.key});

  // There is a form of constructor that makes is to that there are predetermined values for the class to work off of, so that you can call them without having to change the personalization of them
  // You can call upon is as if it were a function, and you can set multiple of them like this:

  GradientContainer.purpleHaze({super.key})
      : colorado = [
          const Color.fromARGB(255, 76, 8, 202),
          const Color.fromARGB(255, 47, 28, 80)
        ];

  // A record type is unmodifiable, so you won't be able to change the values once they are set, but its quite combinient for struct like arguments you wish to use inside functions
  // they are used like this
  // var myVector = (x: 42, y: 37);
  // print(myVector.x);

  final List<Color> colorado;

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorado
            /* [
            colorado[0],
            colorado[1],
            /* Color.fromARGB(255, 54, 32, 92),
            Color.fromARGB(255, 134, 82, 224), */
          ] */
            ,
            begin: startAlignment,
            end: endAlignment,
          ),
        ),
        child: Center(
          child: Column(
            children: const [
              TextWidgetPersonal(
                'Boton TEST para mandar emails',
              ), //calling hotbrewed Text widget
              if(kIsWeb) EmailButtonWeb()
              else if(Platform.isAndroid || Platform.isIOS) EmailButton()
              else EmailButtonWeb(),// im checking if the platform is android, if yes use EmailButton for android and if not for Web
            ],
          ),
          /* child: TextWidgetPersonal(
            'Pocoyo mi Polloloco la loco'), //calling hotbrewed Text widget
      ), */
        ));
  }
}
