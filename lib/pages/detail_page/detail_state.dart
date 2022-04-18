import 'package:movieapp/core/class/state_class.dart';
import 'package:movieapp/data/detail_movie/detail_movie_model/detail_movie_model.dart';
import 'package:movieapp/data/detail_movie/detail_movie_provider/detail_movie_provider.dart';
import 'package:get/get.dart';

class DetailState extends StateClass {
  DetailMovieProvider detailMovieProvider = DetailMovieProvider();

  var data = ListDetailMovieModel().obs;

  getDetailMovie(int movieId) async {
    loading.value = true;
    var response = await detailMovieProvider.getDetailMovieList(movieId);
    data.value = response;
    loading.value = false;
  }
}
