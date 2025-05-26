import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart';
import 'package:a/Vistas/colores/colores.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  String newsText = '[News]';

  @override
  void initState() {
    super.initState();
    loadNews();
  }

  Future<void> loadNews() async {
    try {
      final xmlString = await rootBundle.loadString('assets/news.xml');
      final document = XmlDocument.parse(xmlString);
      final firstNews = document.findAllElements('item').first.text;
      setState(() => newsText = firstNews);
    } catch (e) {
      setState(() => newsText = 'No se pudo cargar la noticia.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          const Icon(Icons.mail, color: AppColors.primaryDark),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              newsText,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.primaryDark,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
