import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/Core/Colors.dart';
import 'package:news/Wedgit/main_load.dart';
import 'package:news/Wedgit/news_item.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/models/news_respons.dart';

class Newsdataview extends StatefulWidget {
  final String sourceId;

  Newsdataview({super.key, required this.sourceId});

  @override
  State<Newsdataview> createState() => _NewsdataviewState();
}

class _NewsdataviewState extends State<Newsdataview> {
  int selectedIndex = -1;
  late Future<NewsRespons> newsFuture;

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  void _loadNews() {
    newsFuture = ApiManager.getNewsData(widget.sourceId);
  }

  @override
  void didUpdateWidget(covariant Newsdataview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sourceId != widget.sourceId) {
      _loadNews(); // نعمل call جديد لل API
      selectedIndex = -1; // نرجع التحديد لـ default
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsRespons>(
      future: newsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLoad();
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).splashColor,
              ),
            ),
          );
        }

        List<Articles> articles = snapshot.data?.articles ?? [];

        if (articles.isEmpty) {
          return Center(
            child: Text(
              'No articles found',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).splashColor,
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final article = articles[index];
              return NewsItem(
                article: article,
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = selectedIndex == index
                        ? -1
                        : index; // toggle
                  });
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: articles.length,
          ),
        );
      },
    );
  }
}
