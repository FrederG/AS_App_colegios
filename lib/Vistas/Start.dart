import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xml/xml.dart' as xml;
import 'package:flutter/services.dart' show rootBundle;
import 'package:a/Vistas/colores/colores.dart';
import 'package:a/Vistas/navegacion/Configuracion.dart' as nav;
import 'package:a/screens/Iniciop.dart';
import 'package:a/widgets/news_widget.dart';

class Start extends StatefulWidget {
  final PageController pageController;

  const Start({super.key, required this.pageController});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  String studentName = '[Student Name]';
  String studentRole = '[ROL]';
  List<String> newsItems = [];
  int currentImageIndex = 0;
  PageController imageController = PageController();

  final List<String> carouselImages = [
    'assets/noticia1.png',
    'assets/noticia2.png',
    'assets/noticia3.png',
  ];

  @override
  void initState() {
    super.initState();
    fetchUserData();
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
  }

  Future<void> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (doc.exists) {
        setState(() {
          studentName = doc['name'] ?? '[Student Name]';
          studentRole = doc['role'] ?? '[ROL]';
        });
      }
    }
  }

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
                        Image.asset("assets/Logo.png", width: 70),
                        Text(
                          "SkillNet",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
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
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.background,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Principal()),
                      );
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

            // Contenido principal
            Positioned(
              top: 170,
              left: 20,
              right: 20,
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
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Botón Foros
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () => widget.pageController.jumpToPage(1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDark,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(100, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.forum, color: AppColors.white, size: 25),
                          const SizedBox(width: 10),
                          Text(
                            "Foros",
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

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
                        children: [
                          Icon(
                            Icons.settings,
                            color: AppColors.white,
                            size: 28,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Configuración",
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
