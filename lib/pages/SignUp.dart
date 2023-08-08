import 'package:demos/pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  var animationLink = 'icons/login-bear.riv';
  SMITrigger? failTrigger, successTrigger;
  SMIBool? isHandsUp, isChecking;
  SMINumber? lookNum;
  StateMachineController? stateMachineController;
  Artboard? artboard;

  @override
  void initState() {
    rootBundle.load(animationLink).then((value) {
      final file = RiveFile.import(value);
      final art = file.mainArtboard;
      stateMachineController =
          StateMachineController.fromArtboard(art, "Login Machine");

      if (stateMachineController != null) {
        art.addController(stateMachineController!);

        stateMachineController!.inputs.forEach((element) {
          if (element.name == "isChecking") {
            isChecking = element as SMIBool;
          } else if (element.name == "isHandsUp") {
            isHandsUp = element as SMIBool;
          } else if (element.name == "trigSuccess") {
            successTrigger = element as SMITrigger;
          } else if (element.name == "trigFail") {
            failTrigger = element as SMITrigger;
          } else if (element.name == "numLook") {
            lookNum = element as SMINumber;
          }
        });
      }
      setState(() => artboard = art);
    });
    super.initState();
  }

  void lookAround() {
    isChecking?.change(true);
    isHandsUp?.change(false);
    lookNum?.change(0);
  }

  void moveEyes(value) {
    lookNum?.change(value.length.toDouble());
  }

  void handsUpOnEyes() {
    isHandsUp?.change(true);
    isChecking?.change(false);
  }

  void SignUpClick() {
    isChecking?.change(false);
    isHandsUp?.change(false);

    if ((emailController.text).isEmpty && (passController.text).isEmpty) {
      failTrigger?.fire();
    } else {
      // successTrigger?.fire();
      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //artboard
              if (artboard != null)
                SizedBox(
                  width: 400,
                  height: 350,
                  child: Rive(artboard: artboard!),
                ),

              //login container
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: 400,
                  padding: const EdgeInsets.only(bottom: 10),
                  margin: const EdgeInsets.only(bottom: 8 * 4),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      onTap: lookAround,
                      onChanged: ((value) => moveEyes(value)),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Email',
                          focusColor: Colors.white,
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 0),
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: 400,
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  margin: const EdgeInsets.only(bottom: 8 * 4),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      onTap: handsUpOnEyes,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Password',
                          focusColor: Colors.white,
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  'Already have account? Login!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: () => {
                    SignUpClick(),
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
