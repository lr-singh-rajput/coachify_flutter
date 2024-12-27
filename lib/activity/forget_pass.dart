import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPass extends StatelessWidget{
  var forgetEmail= TextEditingController();

  ForgetPass({super.key});
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   appBar: AppBar(title: const Text('Forget Password'),
   backgroundColor: Colors.orange,),
   body: Center(
     child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
       child: Card(
         color: Colors.orange,
         child: Container(
           height: 400,
           width: 300,
           color: Colors.orange,
           child: Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Padding(
                   padding: EdgeInsets.only(left: 8.0),
                   child: Text('Email Address',style: TextStyle(color: Colors.black,fontSize: 18,),),
                 ),
                 const SizedBox(height: 10,),
                 TextField(
                   controller: forgetEmail,
                   keyboardType: TextInputType.emailAddress,
                   decoration: InputDecoration(
                     hintText: 'Enter your Email ID',
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(11),
                         borderSide: const BorderSide(
                         color: Colors.black,
                         width: 2
                       )
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(11),
                         borderSide: const BorderSide(
                         color: Colors.blue,
                         width: 2,
                       )
                     )
                   ),

                 ),
                 const SizedBox(height: 70,),
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ElevatedButton(onPressed: (){
                       String emailforget= forgetEmail.text.toString();

                     }, child: const Text("Forget password",style: TextStyle(color: Colors.blue,fontSize: 15),)),
                   ],
                 )
               ],
             ),
           ),
         ),
       ),
     ),
   ),
 );
  }

}