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
      home: MyHomePage(title: 'Contoh Fokus'),
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
  // Membuat objek dari kelas GlobalKey untuk Form dan Scaffold
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Membuat objek dari kelas FocusNode
  late FocusNode myFocusNode;

  // Membuat objek dari kelas TextEditingController
  final TextEditingController prodiController = TextEditingController();

  // Membuat fungsi (method) yang akan digunakan untuk menangani kejadian perubahan teks
  void printValue() {
    print("Teks pada field Program Studi: ${prodiController.text}");
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    // Mengaitkan antara controller dan fungsi printValue() menggunakan addListener
    prodiController.addListener(printValue);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    prodiController.dispose();
    super.dispose();
  }

  void validateInput() {
    FormState? form = formKey.currentState;
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
                  icon: Icon(Icons.person_pin, color: Colors.pink),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Nim tidak boleh kosong';
                  }
                },
                autofocus: true,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nama',
                  labelText: 'Nama',
                  icon: Icon(Icons.person, color: Colors.pink),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                },
                focusNode: myFocusNode,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: prodiController,
                decoration: const InputDecoration(
                  hintText: 'Program Studi',
                  labelText: 'Program Studi',
                  icon: Icon(Icons.dashboard, color: Colors.pink),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Prodi tidak boleh kosong';
                  }
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Semester',
                  labelText: 'Semester',
                  icon: Icon(Icons.format_list_numbered, color: Colors.pink),
                ),
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Semester tidak boleh kosong';
                  }
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
                    child: const Text('Fokus ke Nama'),
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
