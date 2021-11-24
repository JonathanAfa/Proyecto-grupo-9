import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onViewSwitch;

  const LoginScreen({Key? key, required this.onViewSwitch}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(color: Colors.red,child: Column(children: [Text( "Cryto Compact",
              style: Theme.of(context).textTheme.headline1,)],),)
         
          ),const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "LOGIN",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "CORREO ELECTRONICO",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '',filled: true,
                  fillColor: Color(0xFFB3B3B3)
            
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "CONTRASEÑA",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '',filled: true,
                  fillColor: Color(0xFFB3B3B3),
            
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed('/content');
                    },
                    child: const Text("Login",style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    
                    
                  ),
                ),
              )
            ],
          ),
          TextButton(
              onPressed: widget.onViewSwitch, child: const Text("Registrarse",style: TextStyle(color: Colors.black),)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Equipo 9",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
