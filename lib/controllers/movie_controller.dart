import 'package:get/get.dart';
import 'package:moviesapp/models/credits.dart';
import 'package:moviesapp/models/details.dart';
import 'package:moviesapp/models/popular.dart';
import 'package:moviesapp/models/result.dart';
import 'package:moviesapp/services/api_service.dart';

class MovieController extends GetxController {
  var populars = <Result>[].obs;
  var topRated = <Result>[].obs;
  var cast = <Cast>[].obs;
  var genre = <Genre>[].obs;
  
  
var service = ApiService();
void onInit() {
    getPopularMovies();
    getTopRatedMovies();
    
    super.onInit();
  }

  getPopularMovies() async {
    var movies = await service.getPopular();
    populars.value = movies;

  }
   getTopRatedMovies() async {
    var topRatedMovies = await service.getTopRated();
    topRated.value = topRatedMovies;

  }
  getCast(int? id) async{
    var creditsMovies = await service.getCastMovie(id!);
    cast.value = creditsMovies!;
    
  }
    getGenre(int? id) async{
    var genreMovies = await service.getDetailsMovie(id!);
    genre.value = genreMovies.genres!;
    
  }
  // }
  // getTopRatedMovies() async {
  //   var movies = await service.GetTopRated();
  //   topRateds.value = movies;
    
    
  // }
}
