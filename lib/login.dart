import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Your logo image
                Image.asset(
                  'assets/logo1.png', // Replace with the path to your logo image
                  width: 120.0, // Adjust the width as needed
                  height: 120.0, // Adjust the height as needed
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email, color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    // Add email validation if needed
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    icon: Icon(Icons.lock, color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Validate the form before proceeding with login
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        // Implement navigation to the registration screen
                        print('Navigate to registration screen');
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                InkWell(
                  onTap: () {
                    // Implement navigation to the forgot password screen
                    print('Navigate to forgot password screen');
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
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

  void _login() {
    // Implement your authentication logic here
    String email = _emailController.text;
    String password = _passwordController.text;

    // TODO: Integrate with backend authentication service.
    // Validate credentials and navigate to the next screen if valid.

    // For simplicity, this example just prints the credentials.
    print('Email: $email, Password: $password');
  }
}
