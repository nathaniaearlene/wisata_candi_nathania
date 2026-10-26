import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //TO-DO 1: Deklarasikan Variabel
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText ='';

  bool _isSignedIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TO-DO 2: Pasang Appbar
      appBar: AppBar(title: Text('Sign In'),),

      //TO-DO 3: Pasang Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(

                //TO-DO 4: Atur mainAxisAlignment dan crossAxisAlignment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //TO-DO 5:  Pasang TextFormField Nama Pengguna
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Nama Pengguna',
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
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility
                          ),
                        )
                    ),
                    obscureText: _obscurePassword,
                  ),


                  //TO-DO 7: Pasang ElevatedButton SignIn
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text('Sign In'),
                  ),

                  //TO-DO 8: Pasang TextButton Sign In
                  TextButton(
                    onPressed: (){},
                    child: Text('Belum Punya Akun? Daftar Di Sini.'),),
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}