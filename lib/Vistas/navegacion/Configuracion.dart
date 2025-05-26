import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:a/Vistas/colores/colores.dart';
import 'package:a/Vistas/navegacion/Barranavegacion.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Controladores para los campos
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _rolController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        final data = doc.data()!;
        _nameController.text = data['name'] ?? '';
        _lastnameController.text = data['lastname'] ?? '';
        _rolController.text = data['role'] ?? ''; // <-- Corregido aquí
        _emailController.text = data['email'] ?? '';
        _ageController.text = (data['age'] ?? '').toString();
      }
    }
  }

  Future<void> _saveUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore.collection('users').doc(user.uid).set({
          'name': _nameController.text,
<<<<<<< HEAD
          'lastname': _lastnameController.text,
          'role': _rolController.text, // <-- Corregido aquí
          'email': _emailController.text,
=======
          'lastname': _lastnameController.text, // <-- Corregido aquí
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
          'age': int.tryParse(_ageController.text) ?? 0,
        }, SetOptions(merge: true));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Datos guardados exitosamente')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar datos: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            color: AppColors.primaryDark,
            child: Center(
              child: Text(
                "EDIT PROFILE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.amber[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildTextField("NAME", _nameController),
                        SizedBox(width: 8),
                        _buildTextField("ROLE", _rolController),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        _buildTextField("LASTNAME", _lastnameController),
                        SizedBox(width: 8),
                        _buildTextField("EMAIL", _emailController),
                      ],
                    ),
                    SizedBox(height: 10),
                    _buildTextField("AGE", _ageController),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BNavegacion()),
                            );
                          },
                          backgroundColor: AppColors.background,
                          shape: CircleBorder(
                            side: BorderSide(color: AppColors.primaryDark, width: 2),
                          ),
                          child: Icon(Icons.arrow_back, color: AppColors.black),
                        ),
                        FloatingActionButton(
                          onPressed: _saveUserData,
                          backgroundColor: AppColors.background,
                          shape: CircleBorder(
                            side: BorderSide(color: AppColors.primaryDark, width: 2),
                          ),
                          child: Icon(Icons.save, color: AppColors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontSize: 14),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo[900]!),
          ),
        ),
      ),
    );
  }
}
