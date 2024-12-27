import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newfist/activity/login_page.dart';
import 'package:newfist/controller/authController.dart';

class RagisterPage extends StatelessWidget{
  AuthController authController = Get.put(AuthController());

   TextEditingController emailTextregi =TextEditingController();
   TextEditingController passTextregi =TextEditingController();
   TextEditingController cnameTextregi =TextEditingController();
   TextEditingController nameTextregi =TextEditingController();
   TextEditingController numberlTextregi =TextEditingController();

  RagisterPage({super.key});
  // emailTextregi =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(51),
            child: Card(
              elevation: 11,
              color: Colors.amber,
              child: Container(
                height: 800,
                width: 400,
                color: const Color(0xFFFFB854),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection:Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          const Text('Ragister',
                          style: TextStyle(fontSize: 25,color: Colors.black,fontWeight:FontWeight.w500),),
                          const SizedBox(height: 50,),
                          TextField(
                            controller: nameTextregi,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'enter your coaching name',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              )
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: emailTextregi,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'enter your email ',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2
                                )
                              )
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextField(
                            controller: numberlTextregi,
                            keyboardType:TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "enter your number",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                  borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              )
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextField(
                            controller: passTextregi,
                            keyboardType:TextInputType.text,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              hintText: "enter your password",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                  borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              )
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextField(
                            controller: cnameTextregi,
                            keyboardType:TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "enter your coaching name",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: const BorderSide(
                                      color: Colors.green,
                                      width: 2,
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    )
                                )
                            ),
                          ),
                          const SizedBox(height: 50,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: ()async{
                                // String emailRegis = emailTextregi.text.toString();
                                // String passRegis =passTextregi.text.toString();
                                // String repassRegis = cnameTextregi.text.toString();
                                // String nameRegis =  nameTextregi.text.toString();
                                // String numberRegis = numberlTextregi.text.toString();
                                //

                                authController.createUser(emailTextregi.text, passTextregi.text, cnameTextregi.text, nameTextregi.text, numberlTextregi.text,context);

                              }, child: const Text("Ragister",style: TextStyle(color: Colors.blue),)),

                              SizedBox(width: 50,),

                              ElevatedButton(onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>  LoginPage()));
                              }, child: const Text("Login",style: TextStyle(color: Colors.blue),)),
                            ],
                          ),

                        ]
                      ),
                    ),
                  ),

                ),
              ),
            ),
          )
      ),
    );
  }

}