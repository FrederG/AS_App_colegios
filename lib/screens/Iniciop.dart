import 'package:a/screens/login_screen.dart';
import 'package:a/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
<<<<<<< HEAD
  const Principal({super.key});
=======
  const Principal({Key? key}) : super(key: key);
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillNet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3F91B9), // Updated to match logo color
          primary: const Color(0xFF3F91B9),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const Login(),
        '/register': (context) => const Registro(),
      },
    );
  }
}

class WelcomeScreen extends StatefulWidget {
<<<<<<< HEAD
  const WelcomeScreen({super.key});
=======
  const WelcomeScreen({Key? key}) : super(key: key);
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    // Configuración del controlador de animación
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Duración de la animación
    );

    // Configuración de la animación de desplazamiento
    _animation = Tween<Offset>(
      begin: const Offset(0, -1), // Comienza fuera de la pantalla (arriba)
      end: Offset.zero, // Termina en su posición original
<<<<<<< HEAD
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
=======
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be

    // Inicia la animación
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera el controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E8D4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Animación del logo
              SlideTransition(
                position: _animation,
                child: Image.asset(
                  'assets/logo.png', // Asegúrate de que el logo esté en los assets
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 24),
<<<<<<< HEAD
              Text(
                "Bienvenido a ",
=======
              Text("Bienvenido a ",
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: GoogleFonts.poppins().fontStyle,
                  color: Colors.black54,
                ),
              ),
              const Text(
                'SkillNet',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3F91B9),
                ),
              ),
              const SizedBox(height: 12),

<<<<<<< HEAD
=======
               
              
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
              Text(
                'Conectando talento, Creando oportunidades',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: GoogleFonts.poppins().fontStyle,
                  color: Colors.black54,
                ),
              ),
              const Spacer(),
              // Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F1440),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  'Login',
<<<<<<< HEAD
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
=======
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                ),
              ),
              const SizedBox(height: 16),
              // Register Button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF0F1440)),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F1440),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
