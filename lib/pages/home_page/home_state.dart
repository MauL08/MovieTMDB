import 'package:movieapp/core/class/state_class.dart';
import 'package:movieapp/data/list_movie/list_movie_model/list_movie_model.dart';
import 'package:movieapp/data/list_movie/list_movie_provider/list_movie_provider.dart';
import 'package:get/get.dart';

class HomeState extends StateClass {
  ListMovieProvider listMovieProvider = ListMovieProvider();

  var data = ListMovieModel().obs;

  getListMovieData() async {
    loading.value = true;
    var response = await listMovieProvider.getListMovie();
    data.value = response;
    loading.value = false;
  }
}
