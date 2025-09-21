/***THis APi Like ArmPoint Type login Page App **/
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup':(context) => const Signup(),

      },
    );
  }
}


class Signup extends StatelessWidget {
  const Signup({super.key});
  
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
  
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 21, 50),
      appBar: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child:AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                )
      ),
        
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/Frame.jpg'
              ),
            ),
            const SizedBox(height: 10),
        
               Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
          
                  child:
                   SingleChildScrollView(
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "Login to your account",
                            style: TextStyle(
                              fontSize: 27.02,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(221, 4, 0, 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        /*********************
                        const Text(
                          "Email",
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 3),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'abc@email.com',
                            hintStyle: TextStyle(
                                color:
                                    const Color.fromARGB(255, 142, 141, 141)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          
                        ),
                        const SizedBox(height: 20),
                        
                        const Text(
                          "Enter Password",
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 3),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '**********',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Forgot Password clicked")),
                              );
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color(0xFFCF2B1D),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFFCF2B1D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/HomePage ');
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'New User? ',
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 14),
                              children: [
                                TextSpan(
                                  text: 'Register Now',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF040404),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/signup');
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        
                        const Center(
                          child: Text(
                            'By signing up I agree to the Terms and\nConditions and Privacy Policy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 24, 2, 2),
                              fontSize: 12,
                            ), 
                          ), 
                        ), */
                      ],
                                       ),
                   ),
                ), 
              ),
            ),
               )
          ],
        ),
      ),
    );
  }
}

