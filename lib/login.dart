import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Please enter your mobile number",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "You'll receive a 6 digit code",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                ),
                const Center(
                  child: Text(
                    "to verify next",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLength: 10,
                  controller: _controller,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'lib/ICONS/india.png', // Replace with your asset image path
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                    prefixIconConstraints:
                        const BoxConstraints(minWidth: 40, minHeight: 20),
                    prefixText: '+91',
                    border: const OutlineInputBorder(),
                    labelText: 'Mobile Number',
                    hintText: 'Enter your mobile number',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'Please enter a valid number';
                    } else if (value.length != 10) {
                      return 'Mobile number must be 10 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {

                      await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '+91 8428 429 770',
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {},
  codeAutoRetrievalTimeout: (String verificationId) {},
);
                      // Add your submission logic here
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromARGB(255, 14, 1, 43)),
                    minimumSize:
                        WidgetStateProperty.all<Size>(const Size(160, 50)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Make it square
                      ),
                    ),
                  ),
                  child: const Text(
                    'Submit',
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
      ),
    );
  }
}
