import 'package:flutter/material.dart';
import 'package:wisha/screens/login_medico.dart';
import 'package:wisha/screens/login_paciente.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60, bottom: 60),
              child: Text(
                "WISHA",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Form(
                child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const Login_Paciente()));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigoAccent),
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size.fromWidth(250)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      'PACIENTE',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const Login_Medico()));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.greenAccent),
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size.fromWidth(250)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      'MEDICO',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
