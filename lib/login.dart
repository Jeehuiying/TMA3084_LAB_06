import 'package:material_ui/material_ui.dart';

import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hotel Booking Application",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),

      body: Container(
        color: Colors.pink[200],
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 10,
              color: Colors.white.withValues(alpha: 0.95),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(
                          'assets/images/hotel_logo.png',
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email Address",
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xFF0D47A1),
                            ),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Enter your email" : null,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xFF0D47A1),
                            ),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Enter password" : null,
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: Colors.green[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Dashboard(),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Back to SignUp
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(color: Colors.green[700]),
                        ),
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
