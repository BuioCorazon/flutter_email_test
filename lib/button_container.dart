// import 'dart:io';
import 'dart:async';
// import 'dart:math';
// FOR ANDROID
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'package:flutter/material.dart';

class EmailButton extends StatefulWidget {
  const EmailButton({super.key});

  @override
  createState() => _EmailButtonState();
}

class _EmailButtonState extends State<EmailButton> {
  // EmailButton({super.key});

  bool isHTML = false;
  final _recipient = 'duvakin96@hotmail.com';
  final _subject = 'Ejemplo Dart';
  final _body = 'Ejemplo de aplicacion Flutter & Dart para enviar correos';

  Future<void> send() async {
    final Email email = Email(
      body: _body,
      subject: _subject,
      recipients: [_recipient],
      isHTML: isHTML,
    );

    String? platformRespone;

    try {
      await FlutterEmailSender.send(email);
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

