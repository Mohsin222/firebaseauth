// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/phone_auth/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OTPScreen extends StatefulWidget {
  String verificationId;
   OTPScreen({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
    TextEditingController otpController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('OTP'),),
              body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.phone,
            controller: otpController,),
        ),

        SizedBox(height: 30,),

        ElevatedButton(onPressed: ()async{
try {
  PhoneAuthCredential credential =await PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: otpController.text.trim().toString());

await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

}).catchError((e){

});
} catch (e) {
  print(e);
}

        }, child: Text('Verify OTP Number'))
      ]),
    );
  }
}