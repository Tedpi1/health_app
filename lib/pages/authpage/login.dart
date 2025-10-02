import 'package:flutter/material.dart';
import 'package:health_app/functions/constant/appColors.dart';
import 'package:health_app/functions/constant/screenSize.dart';
import 'package:health_app/pages/home/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int _selectedrole=3;

  bool obsecure = true; // start with hidden password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 700;

          return Center(
            child: Container(
              width: isMobile
                  ? ScreenSize.width(context) * 0.9
                  : ScreenSize.width(context) * 0.6,
              height: isMobile
                  ? null
                  : ScreenSize.height(context) * 0.6, // taller on desktop
              margin: EdgeInsets.symmetric(
                horizontal: ScreenSize.width(context) * 0.05,
                vertical: ScreenSize.height(context) * 0.02,
              ),
              decoration: BoxDecoration(
                color: AppColors.clrPrimary9,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _loginPage()),
                  if (!isMobile) const VerticalDivider(width: 1),
                  Expanded(flex: 1, child: _welcomePage()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Login form section
  Widget _loginPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'AFYA YANGU APP',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.clrBlack,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // Email
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email, color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Password
            TextFormField(
              controller: _passwordController,
              obscureText: obsecure,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                border: const UnderlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    obsecure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      obsecure = !obsecure;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            // Sign in button
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage(role: _selectedrole)),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logging in...')),
                  );
                }
              },
              icon: const Icon(Icons.login, color: Colors.white),
              label: const Text("Sign In"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.teal[700]!;
                    }
                    return AppColors.clrPrimary9;
                  },
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),  
          ],
        ),
      ),
    );
  }

  /// Welcome / branding section
  Widget _welcomePage() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white.withOpacity(0.9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.health_and_safety, size: 100, color: Colors.teal),
            SizedBox(height: 20),
            Text(
              "Welcome to Afya Yangu",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Your health, your control.\nSign in to continue.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
