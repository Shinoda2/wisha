import 'package:flutter/material.dart';

class Login_Medico extends StatefulWidget {
  const Login_Medico({Key? key}) : super(key: key);
  @override
  _Login_Medico createState() => _Login_Medico();
}

class _Login_Medico extends State<Login_Medico> {
  @override
  Widget build(BuildContext context) {
    String valor;
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 60, bottom: 60),
                  child: TextField(),
                )
              ],
            )));
  }
}
