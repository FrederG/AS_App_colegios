import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_repository.dart';
import 'message_bubble.dart';
import 'message_model.dart';

class ChatScreen extends StatelessWidget {
  final String groupId;
  const ChatScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    final chatRepo = Provider.of<ChatRepository>(context);
<<<<<<< HEAD
    final TextEditingController controller = TextEditingController();
=======
    final TextEditingController _controller = TextEditingController();
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be

    return Scaffold(
      // Fondo crema (color hexadecimal #F5F5F5)
      backgroundColor: const Color.fromARGB(255, 246, 233, 216),
      body: Column(
        children: [
          // AppBar simplificado
          AppBar(
            title: const Text(
              'Chat Grupal',
              style: TextStyle(color: Colors.white),
            ),
<<<<<<< HEAD
            backgroundColor: const Color.fromARGB(
              255,
              9,
              14,
              61,
            ), // Azul oscuro
            iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 12, 7, 52),
            ),
=======
            backgroundColor: const Color.fromARGB(255, 9, 14, 61), // Azul oscuro
            iconTheme: const IconThemeData(color: Color.fromARGB(255, 12, 7, 52)),
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
            elevation: 0,
          ),
          // Área de mensajes
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: chatRepo.getMessages(groupId),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  // Muestra un mensaje predeterminado o una lista vacía
                  return const Center(
                    child: Text(
                      'No hay mensajes aún.',
<<<<<<< HEAD
                      style: TextStyle(
                        color: Color.fromARGB(255, 12, 7, 52),
                        fontSize: 16,
                      ),
=======
                      style: TextStyle(color: Color.fromARGB(255, 12, 7, 52), fontSize: 16),
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                    ),
                  );
                }
                return ListView.builder(
                  reverse: true,
<<<<<<< HEAD
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    8,
                  ), // Ajuste de padding
=======
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8), // Ajuste de padding
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(message: snapshot.data![index]);
                  },
                );
              },
            ),
          ),
          // Input de mensaje
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 232, 232),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
<<<<<<< HEAD
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
=======
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                ),
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
<<<<<<< HEAD
                    controller: controller,
=======
                    controller: _controller,
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF0C0734)),
                  onPressed: () {
<<<<<<< HEAD
                    if (controller.text.isNotEmpty) {
                      chatRepo.sendMessage(groupId, controller.text);
                      controller.clear();
                    }
=======
                    if (_controller.text.isNotEmpty) {
                      chatRepo.sendMessage(groupId,_controller.text);
                      _controller.clear();
                    }
                    
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 2378459b8acb213ea2ef997815e6390d612842be
