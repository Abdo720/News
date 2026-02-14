import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/Core/Colors.dart';
import 'package:news/Wedgit/main_error.dart';
import 'package:news/Wedgit/main_load.dart';
import 'package:news/Wedgit/newsDataView.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/models/news_respons.dart';
import 'package:news/models/source_respons.dart';

class SuorceView extends StatefulWidget {
  String categoryId;
  SuorceView({super.key, required this.categoryId});

  @override
  State<SuorceView> createState() => _SuorceViewState();
}

class _SuorceViewState extends State<SuorceView> {
  late Future<SourceRespons> sourcesFuture;

  @override
  void initState() {
    super.initState();
    sourcesFuture = ApiManager.getSources(widget.categoryId);
  }

  void _retry() {
    setState(() {
      sourcesFuture = ApiManager.getSources(widget.categoryId);
    });
  }

  String _getErrorMessage(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        return error.response?.data['message'] ??
            error.response?.data['error'] ??
            'Server Error: ${error.response?.statusCode}';
      }
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection Timeout';
        case DioExceptionType.receiveTimeout:
          return 'Server Timeout';
        case DioExceptionType.badResponse:
          return 'Bad Response: ${error.response?.statusCode}';
        case DioExceptionType.unknown:
          return error.message ?? 'Unknown Error';
        default:
          return 'Network Error';
      }
    }
    return error.toString();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceRespons>(
      future: sourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLoad();
        } else if (snapshot.hasError) {
          return MainError(
            errorMassage: _getErrorMessage(snapshot.error),
            onclick: _retry,
          );
        }

        List<Sources> sources = snapshot.data?.sources ?? [];

        return Column(
          children: [
            DefaultTabController(
              length: sources.length,
              child: TabBar(
                isScrollable: true,
                indicatorColor: Theme.of(context).splashColor,
                tabAlignment: TabAlignment.start,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                tabs: sources
                    .map(
                      (e) => Tab(
                        child: Text(
                          e.name ?? "",
                          style: TextStyle(
                            color: Theme.of(context).splashColor,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: Newsdataview(sourceId: sources[selectedIndex].id ?? ""),
            ),
          ],
        );
      },
    );
  }
}
