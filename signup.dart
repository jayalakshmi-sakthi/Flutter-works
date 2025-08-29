import 'package:flutter/material.dart';
void main() {
runApp(const MyLoginApp());
}
class MyLoginApp extends StatelessWidget {
const MyLoginApp({super.key});
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Simple Login',
home: const LoginPage(),
debugShowCheckedModeBanner: false,
);
}
}
// ---------------------- LOGIN PAGE ----------------------
class LoginPage extends StatefulWidget {
const LoginPage({super.key});
@override
State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
void _submit() {
String username = _usernameController.text.trim();
String password = _passwordController.text;
showDialog(

context: context,
builder: (context) => AlertDialog(
title: const Text("Login Details"),
content: Text("Username: $username\nPassword: $password"),
actions: [
TextButton(
child: const Text("OK"),
onPressed: () => Navigator.of(context).pop(),
)
],
),
);
}
void _navigateToRegister() {
Navigator.push(
context,
MaterialPageRoute(builder: (context) => const RegistrationPage()),
);
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text("Login Page")),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
children: [
TextField(
controller: _usernameController,
decoration: const InputDecoration(labelText: "Username"),
),
TextField(
controller: _passwordController,
obscureText: true,
decoration: const InputDecoration(labelText: "Password"),
),
const SizedBox(height: 20),
ElevatedButton(
onPressed: _submit,
child: const Text("Login"),
),
TextButton(
onPressed: _navigateToRegister,
child: const Text("Don't have an account? Register"),
),
],

),
),
);
}
}
// ---------------------- REGISTRATION PAGE ----------------------
class RegistrationPage extends StatefulWidget {
const RegistrationPage({super.key});
@override
State<RegistrationPage> createState() => _RegistrationPageState();
}
class _RegistrationPageState extends State<RegistrationPage> {
final TextEditingController _nameController = TextEditingController();
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _confirmPasswordController = TextEditingController();
void _register() {
String name = _nameController.text.trim();
String username = _usernameController.text.trim();
String password = _passwordController.text;
String confirmPassword = _confirmPasswordController.text;
if (name.isEmpty || username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
_showMessage("All fields are required.");
return;
}
if (password != confirmPassword) {
_showMessage("Passwords do not match.");
return;
}
showDialog(
context: context,
builder: (context) => AlertDialog(
title: const Text("Registration Successful"),
content: Text("Name: $name\nUsername: $username\nPassword: $password"),
actions: [
TextButton(
child: const Text("OK"),
onPressed: () {
Navigator.of(context).pop(); // Close dialog
Navigator.of(context).pop(); // Go back to LoginPage

},
),
],
),
);
}
void _showMessage(String message) {
showDialog(
context: context,
builder: (context) => AlertDialog(
title: const Text("Error"),
content: Text(message),
actions: [
TextButton(
child: const Text("OK"),
onPressed: () => Navigator.of(context).pop(),
)
],
),
);
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text("Registration Page")),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: SingleChildScrollView( // In case of keyboard overflow
child: Column(
children: [
TextField(
controller: _nameController,
decoration: const InputDecoration(labelText: "Full Name"),
),
TextField(
controller: _usernameController,
decoration: const InputDecoration(labelText: "Username"),
),
TextField(
controller: _passwordController,
obscureText: true,
decoration: const InputDecoration(labelText: "Password"),
),
TextField(
controller: _confirmPasswordController,
obscureText: true,

decoration: const InputDecoration(labelText: "Confirm Password"),
),
const SizedBox(height: 20),
ElevatedButton(
onPressed: _register,
child: const Text("Register"),
),
],
),
),
),
);
}
}
