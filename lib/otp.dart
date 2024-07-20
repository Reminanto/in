import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
//import 'package:liveeasy/loginpage.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(0),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(0),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              const Text(
                "Verify Phone",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26,),
              ),
             // const Center(
              //  child: Text(
                  //"Code is sent to $_controller",
                //  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
               // ),
            //  ),
              const SizedBox(height: 16),
              Pinput(
                length: 6, // Corrected here
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                //onCompleted: (pin) => print(pin),
              ),
                const SizedBox(height: 16),
              Center(
                child: Row(
                  children:[
                    const Text("Didn't receive the code?"),
                    TextButton(
                      onPressed:(){},
                      child:const Text('Request Again')
                    ),
                  ]
                  ,
                ),
              ),
               ElevatedButton(
              onPressed: () {
                //Navigator.push(
                //  context,
                 // MaterialPageRoute(builder: (context) => const VerificationPage()),
                //);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                    const Color.fromARGB(255, 14, 1, 43)),
                minimumSize:
                    WidgetStateProperty.all<Size>(const Size(450, 50)), // Increase size
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Make it square
                  ),
                ),
              ),
              child: const Text(
                'VERIFY AND CONTINUE',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
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


