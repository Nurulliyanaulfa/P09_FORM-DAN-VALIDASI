import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown[300], // Warna coklat untuk AppBar
          iconTheme: IconThemeData(color: Colors.brown[800]), // Warna coklat untuk ikon di AppBar
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void validateInput() {
    final FormState? form = formKey.currentState;
    const snackBar = SnackBar(
      content: Text('Semua data sudah tervalidasi'),
    );
    if (form!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nim',
                  labelText: 'Nim',
                  icon: Icon(Icons.person_pin),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown), // Warna coklat untuk border
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Nim tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nama',
                  labelText: 'Nama',
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown), // Warna coklat untuk border
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Program Studi',
                  labelText: 'Program Studi',
                  icon: Icon(Icons.dashboard),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown), // Warna coklat untuk border
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Prodi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Semester',
                  labelText: 'Semester',
                  icon: Icon(Icons.format_list_numbered),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown), // Warna coklat untuk border
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Semester tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: validateInput,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
