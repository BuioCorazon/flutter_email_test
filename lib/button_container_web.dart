import 'dart:async';
// import 'package:emailjs/emailjs.dart';
import 'package:mailto/mailto.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EmailButtonWeb extends StatefulWidget {
  const EmailButtonWeb({super.key});

  @override
  createState() => _EmailButtonStateWeb();
}

class _EmailButtonStateWeb extends State<EmailButtonWeb> {
  // EmailButton({super.key});

  bool isHTML = false;
  final _recipient = 'duvakin96@hotmail.com';
  final _subject = 'Ejemplo Dart Web';
  final _body = 'Ejemplo de aplicacion Flutter & Dart para enviar correos Web';

  Future<void> send() async {
    final mailtoLink = Mailto(
      to: [_recipient],
      subject: _subject,
      body: _body,
    );

    String? platformRespone;

    try {
      await launchUrlString('$mailtoLink');
      platformRespone = 'Viva! Se envio! :D';
    } catch (e) {
      //print(e);
      platformRespone = e.toString();
    }
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformRespone),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
          onPressed: send,
          child: const Text(
            'Mandar Email',
            style: TextStyle(fontSize: 20, color: Colors.purpleAccent),
          ),
        ),
      );
  }

/*   @override
  State<EmailButton> createState() => AppStateDeclaration(); */
}

/* class AppStateDeclaration extends State<EmailButton>{

  bool hasInternet = false;

 

  Future checkUserConnection() async{
                  try {
                    final result = await InternetAddress.lookup('youtube.com');
                    if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
                      setState((){
                        hasInternet = true;
                        });
                    }
                  } catch (e) {
                    
                  }
                }

  @override
    void initState(){
      super.initState();
    }

} */

