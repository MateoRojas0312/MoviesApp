import 'package:moviesapp/models/credits.dart';
import 'package:moviesapp/models/details.dart';
import 'package:moviesapp/models/popular.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapp/models/result.dart';
import 'package:moviesapp/models/top_rated.dart';

class ApiService {


  String apiKey = '0b10170d6b4802ac782f0bc261a41a5c';
  String url = 'api.themoviedb.org';
  String language = 'es-ES';

  Future<List<Result>> getPopular() async {
    var response = await http.get(
      Uri.parse(
          'https://$url/3/movie/popular?api_key=$apiKey&language=$language&page=1'),
    );

    if (response.statusCode == 200) {
      final data = popularFromJson(response.body);
      var result = data.results!;
      return result;
    } else {
      return [];
    }
  }
   Future<List<Result>> getTopRated() async {
    var response = await http.get(
      Uri.parse(
          'https://$url/3/movie/top_rated?api_key=$apiKey&language=$language&page=1'),
    );

    if (response.statusCode == 200) {
      final data = popularFromJson(response.body);
      var result = data.results!;
      return result;
    } else {
      return [];
    }
  }
  Future<List<Cast>?> getCastMovie(int id) async {
    var response = await http.get(
      Uri.parse(
          'https://$url/3/movie/$id/credits?api_key=$apiKey&language=$language'),
    );

    if (response.statusCode == 200) {
      final data = creditsFromJson(response.body);
      var cast = data.cast;
      return cast;
    } else {
      return [];
    }
  }
  
  Future<Details> getDetailsMovie(int id) async {
    var response = await http.get(
      Uri.parse(
          'https://$url/3/movie/$id?api_key=$apiKey&language=$language'),
    );

    if (response.statusCode == 200) {
      final data = detailsFromJson(response.body);
      var cast = data;
      return cast;
    } else {
      var a = Details();
      return a ;
    }
  }
}
