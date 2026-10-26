import 'package:flutter/material.dart';

class SignInScreeen extends StatefulWidget {
  SignInScreeen({super.key});

  @override
  State<SignInScreeen> createState() => _SignInScreeenState();
}

class _SignInScreeenState extends State<SignInScreeen> {
  // TODO: 1. Deklarasikan variabel
  final TextEditingController _usernameController =
  TextEditingController();

  final TextEditingController _passwordController =
  TextEditingController();

  String _errorText = '';

  bool _isSigningIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Pasang AppBar
      appBar: AppBar(title: const Text('Sign In')),
      // TODO: 3. Pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding (
              padding: const EdgeInsets.all(16.0),
              child: Form (
                  child: Column(
                    // TODO: 4. Atur alignment
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    // TODO: 5. TextFormField nama pengguna
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                      //TO-DO 6: Pasang TextFormField Password
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            labelText: 'Kata Sandi',
                            errorText: _errorText.isNotEmpty ? _errorText : null,
                            border: OutlineInputBorder(),
                            suffix: IconButton(
                              onPressed: (){
                                _obscurePassword = !_obscurePassword;
                              },
                              icon: Icon(
                                  _obscurePassword ? Icons.visibility_off : Icons.visibility
                              ),
                            )
                        ),
                        obscureText: _obscurePassword,
                      ),

                    // TODO: 7. ElevatedButton Sign In
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sign In'),
                    ),

                    // TODO: 8. TextButton Sign Up
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Belum punya akun? Daftar di sini.'),
                    ),
                  ],
                  ),
              ),
          ),
        ),
      ),
    );
  }
}
