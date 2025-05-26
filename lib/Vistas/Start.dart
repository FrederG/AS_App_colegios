import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:xml/xml.dart' as xml;
import 'package:flutter/services.dart' show rootBundle;
import 'package:a/Vistas/colores/colores.dart';
import 'package:a/Vistas/navegacion/Configuracion.dart' as nav;
import 'package:a/screens/Iniciop.dart';
import 'package:a/widgets/news_widget.dart';
=======

import 'package:a/Vistas/colores/colores.dart';
import 'package:a/Vistas/navegacion/Configuracion.dart' as nav;
import 'package:a/Vistas/Inicio.dart';
import 'package:a/screens/Iniciop.dart';
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be

class Start extends StatefulWidget {
  final PageController pageController;

  const Start({super.key, required this.pageController});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  String studentName = '[Student Name]';
  String studentRole = '[ROL]';
<<<<<<< HEAD
  List<String> newsItems = [];
  int currentImageIndex = 0;
  PageController imageController = PageController();

  final List<String> carouselImages = [
    'assets/noticia1.png',
    'assets/noticia2.png',
    'assets/noticia3.png',
  ];
=======
  
  get pageController => null;
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be

  @override
  void initState() {
    super.initState();
    fetchUserData();
<<<<<<< HEAD
    loadNewsFromXml();
    startAutoSlide();
  }

  void startAutoSlide() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          currentImageIndex = (currentImageIndex + 1) % carouselImages.length;
        });
        imageController.animateToPage(
          currentImageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        startAutoSlide();
      }
    });
=======
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
  }

  Future<void> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
<<<<<<< HEAD
    if (user != null) {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
=======

    if (user != null) {
      final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
      if (doc.exists) {
        setState(() {
          studentName = doc['name'] ?? '[Student Name]';
          studentRole = doc['role'] ?? '[ROL]';
        });
      }
    }
  }

<<<<<<< HEAD
  Future<void> loadNewsFromXml() async {
    try {
      final String xmlString = await rootBundle.loadString('assets/news.xml');
      final document = xml.XmlDocument.parse(xmlString);
      final items = document.findAllElements('item').map((e) => e.text).toList();
      setState(() {
        newsItems = items;
      });
    } catch (e) {
      print('Error loading XML: $e');
    }
  }

=======
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            // Logo
            Positioned(
              top: 35,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 70)),
                    Row(
                      children: [
<<<<<<< HEAD
                        Image.asset("assets/Logo.png", width: 70),
=======
                        Image.asset(
                          "assets/Logo.png",
                          width: 70,
                        ),
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                        Text(
                          "SkillNet",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
<<<<<<< HEAD
                        ),
=======
                        )
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Info del estudiante
            Positioned(
              top: 120,
              left: 20,
              right: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_circle,
                    color: AppColors.primaryDark,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        studentName,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      Text(
                        studentRole,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.primaryDark,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
<<<<<<< HEAD
                      ),
=======
                      )
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.background,
                    ),
                    onPressed: () {
<<<<<<< HEAD
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Principal()),
                      );
=======
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Principal()));
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                    },
                    child: Icon(
                      Icons.logout,
                      color: AppColors.primaryDark,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
<<<<<<< HEAD

            // Contenido principal
            Positioned(
              top: 170,
              left: 20,
              right: 20,
=======
            Positioned(
              top: 170, // Ajusta la posición vertical del Row
              left: 20,
              right: 20, // Ajusta la posición horizontal
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
              child: Column(
                children: [
                  Text(
                    "Student Information",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 10),

                  // Caja gris con carrusel más grande
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 260, // Aumentado
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.Grey,
                        border: Border.all(color: AppColors.black, width: 2),
                      ),
                      child: Column(
                        children: [
                          // Carrusel ampliado
                          Expanded(
                            flex: 3, // Antes era 2
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: PageView.builder(
                                controller: imageController,
                                onPageChanged: (index) {
                                  setState(() {
                                    currentImageIndex = index;
                                  });
                                },
                                itemCount: carouselImages.length,
                                itemBuilder: (context, index) {
                                  return Image.asset(
                                    carouselImages[index],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  );
                                },
                              ),
                            ),
                          ),

                          // Pie de noticia
                          Expanded(
                            flex: 1,
                            child: NewsWidget(),
=======
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.Grey,
                        border: Border.all(
                          color: AppColors.black,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2, // Ocupa 2/3 del espacio
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[400], // Color gris
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ), // Bordes redondeados solo en la parte superior
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.mail,
                                    color: AppColors.primaryDark,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "[News]",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.primaryDark,
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                          ),
                        ],
                      ),
                    ),
                  ),
<<<<<<< HEAD

                  const SizedBox(height: 50),

                  // Botón Foros
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () => widget.pageController.jumpToPage(1),
=======
                  SizedBox(
                    height: 50,
                  ),
                  // Botón de Foros
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        pageController.jumpToPage(1); // Cambia al índice de la página de Foros
                      },
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDark,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(100, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
<<<<<<< HEAD
=======
                        textStyle: const TextStyle(fontSize: 18),
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
<<<<<<< HEAD
                          Icon(Icons.forum, color: AppColors.white, size: 25),
                          const SizedBox(width: 10),
=======
                          Icon(
                            Icons.forum,
                            color: AppColors.white,
                            size: 25,
                          ),
                          SizedBox(width: 10),
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                          Text(
                            "Foros",
                            style: TextStyle(
                              fontSize: 19,
<<<<<<< HEAD
=======
                              color: AppColors.white,
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
<<<<<<< HEAD

                  const SizedBox(height: 15),

                  // Botón Configuración
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => nav.Settings(),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDark,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
=======
                  SizedBox(
                    height: 15,
                  ),
                  // Botón de Configuración
                  SizedBox(
                    width: 250, // Ancho máximo del botón
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => nav.Settings()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDark,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 80), // Altura mínima del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Ajusta el tamaño del botón al contenido
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                        children: [
                          Icon(
                            Icons.settings,
                            color: AppColors.white,
                            size: 28,
                          ),
<<<<<<< HEAD
                          const SizedBox(width: 10),
=======
                          SizedBox(width: 10), // Espaciado entre el ícono y el texto
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                          Text(
                            "Configuración",
                            style: TextStyle(
                              fontSize: 19,
<<<<<<< HEAD
=======
                              color: AppColors.white,
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
<<<<<<< HEAD
            ),
=======
            )
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
