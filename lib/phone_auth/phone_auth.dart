import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/phone_auth/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PHONE AUTH'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.phone,
            controller: textEditingController,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential creditional) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verificationId, int? resendCode) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen(verificationId:verificationId ,)));
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                  phoneNumber: textEditingController.text.trim().toString());
              } catch (e) {
                print(e.toString());
              }
            },
            child: Text('Verify Phone Number'))
      ]),
    );
  }
}
