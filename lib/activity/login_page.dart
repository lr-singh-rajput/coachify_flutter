import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newfist/activity/forget_pass.dart';
import 'package:newfist/activity/ragister_page.dart';
import 'package:newfist/controller/authController.dart';

class LoginPage extends StatelessWidget{
  LoginPage({super.key});





  @override
  Widget build(BuildContext context) {

    AuthController authController = Get.put(AuthController());

    TextEditingController gmailText = TextEditingController();
    TextEditingController passText = TextEditingController();

return Scaffold(
  body: Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: Card(
        shadowColor: Colors.orange,
        elevation: 11,

        child: Container(
          height: 600,
          width: 370,
          color: const Color(0xFFFFB854),
        //  color: Color(0xFF59842),
         // color: Colors.orange,

          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text("Login",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 30),
                  TextField(
                    controller: gmailText,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                     prefixIcon: const Icon(CupertinoIcons.mail_solid,),
                      hintText: "enter mail",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2
                        )
                      ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2
                          )
                        )

                    ),
                  ),
                  const SizedBox(height: 40,),
                  TextField(
                    controller: passText,
                    keyboardType: TextInputType.text,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password,),
                        hintText: "enter password",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2
                            )
                        )

                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                      onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>  ForgetPass()));

                      },
                      child: const Text("Forget Password",style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.w400),)),
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          child: const Text("Login",style: TextStyle(color: Colors.blue),),
                          onPressed: ()async{
                          await authController.login(gmailText.text, passText.text);


                          }
                      ),
                      const SizedBox(width: 71,),
                      ElevatedButton(
                          child: const Text("Register",style: TextStyle(color: Colors.blue),),

                          onPressed: (){
                           Navigator.push(context,
                           MaterialPageRoute(builder: (context) =>  RagisterPage()));
                          }
                      ),
                    ],
                  ),





                ],
              ),
            ),
          ),

        ),
      ),
    ),
  ),
);
  }

}