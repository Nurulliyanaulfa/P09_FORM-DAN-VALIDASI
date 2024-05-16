import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.pink),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
          labelStyle: TextStyle(color: Colors.black),
          iconColor: Colors.pink,
        ),
      ),
      home: MyHomePage(title: 'Form Pendaftaran Akun'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late FocusNode myFocusNode;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String role = 'User';

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void showData() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
              'Username: ${usernameController.text}\nEmail: ${emailController.text}\nNomor HP: ${phoneController.text}\nRole: $role'),
        );
      },
    );
  }

  void validateInput() {
    FormState? form = formKey.currentState;
    const snackBar = SnackBar(
      content: Text('Semua data sudah tervalidasi'),
    );
    if (form!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      showData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'Username',
                  labelText: 'Username',
                  icon: Icon(Icons.person, color: Colors.pink),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Username tidak boleh kosong';
                  }
                  if (value.length < 4 || value.length > 25) {
                    return 'Username harus terdiri dari 4 hingga 25 karakter';
                  }
                  if (RegExp(r'^[0-9]').hasMatch(value)) {
                    return 'Username tidak boleh dimulai dengan angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  icon: Icon(Icons.email, color: Colors.pink),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (value.length < 4 || value.length > 25) {
                    return 'Email harus terdiri dari 4 hingga 25 karakter';
                  }
                  if (!value.contains('@')) {
                    return 'Email harus mengandung simbol @';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: 'Nomor HP',
                  labelText: 'Nomor HP',
                  icon: Icon(Icons.phone, color: Colors.pink),
                ),
                keyboardType: TextInputType.phone,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Nomor HP tidak boleh kosong';
                  }
                  if (value.length < 10 || value.length > 12) {
                    return 'Nomor HP harus terdiri dari 10 hingga 12 karakter';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Nomor HP harus berupa angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  icon: Icon(Icons.lock, color: Colors.pink),
                ),
                obscureText: true,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  if (value.length < 4 || value.length > 25) {
                    return 'Password harus terdiri dari 4 hingga 25 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  hintText: 'Konfirmasi Password',
                  labelText: 'Konfirmasi Password',
                  icon: Icon(Icons.lock, color: Colors.pink),
                ),
                obscureText: true,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Konfirmasi Password tidak boleh kosong';
                  }
                  if (value.length < 4 || value.length > 25) {
                    return 'Konfirmasi Password harus terdiri dari 4 hingga 25 karakter';
                  }
                  if (value != passwordController.text) {
                    return 'Password dan Konfirmasi Password tidak cocok';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                value: role,
                decoration: const InputDecoration(
                  labelText: 'Role',
                  icon: Icon(Icons.person_pin, color: Colors.pink),
                ),
                items: ['User', 'Admin'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    role = newValue!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Role tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: validateInput,
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: const Text('Fokus ke Username'),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(myFocusNode);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
