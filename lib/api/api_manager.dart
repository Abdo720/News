import 'package:dio/dio.dart';
import 'package:news/api/api_constants.dart';
import 'package:news/models/news_respons.dart';
import 'package:news/models/source_respons.dart';

class ApiManager {
  static Dio dio = Dio();

  static Future<SourceRespons> getSources() async {
    try {
      Response response = await dio.get(
        "${ApiConstants.baseUrl}/v2/top-headlines/sources?apiKey=${ApiConstants.apiKey}",
      );
      SourceRespons sourceRespons = SourceRespons.fromJson(response.data);
      return sourceRespons;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          e.response?.data['massage'] ?? 'Error: ${e.response?.statusCode}',
        );
      }

      rethrow;
    } catch (e) {
      throw Exception('Unexpected Error: $e');
    }
  }

  static Future<NewsRespons> getNewsData(String sourceId) async {
    try {
      Response response = await dio.get(
        "${ApiConstants.baseUrl}/v2/everything?apiKey=${ApiConstants.apiKey}&sources=$sourceId",
      );
      NewsRespons newsRespons = NewsRespons.fromJson(response.data);
      return newsRespons;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          e.response?.data['massage'] ?? 'Error: ${e.response?.statusCode}',
        );
      }

      rethrow;
    } catch (e) {
      throw Exception('Unexpected Error: $e');
    }
  }
}
