import 'package:flutter/material.dart';
import 'package:login/page/beranda.dart';
import 'package:login/page/main_page.dart';
import 'package:login/service/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShow = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / (5 / 2),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/tiga.jpg"), fit: BoxFit.cover)),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / (5 / 2) - 20,
              ),
              Container(
                child: ListView(children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        color: Colors.grey[200]),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        color: Colors.grey[200]),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: !isShow,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isShow = !isShow;
                              });
                            },
                            child: Icon(
                              isShow
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 18,
                              color: Colors.grey[800],
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthFirebase.signIn(
                              emailController.text, passwordController.text)
                          .then((value) => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainPage()),
                              (route) => false))
                          .catchError((_) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Container(
                                    height: 400,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: const Center(
                                            child: Text("Error !",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: const Center(
                                            child: Text(
                                              "email atau password anda salah",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () => Navigator.pop(context),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 20),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                                color: Colors.red),
                                            child: const Text(
                                              "Oke",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          color: Colors.blue[800]),
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ]),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(30, 25, 30, 5),
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewInsets.bottom -
                    MediaQuery.of(context).size.height / (5 / 2) +
                    20,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              )
            ],
          )
        ]),
      ),
    );
  }
}
