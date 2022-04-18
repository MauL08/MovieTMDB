import 'package:movieapp/core/class/provider_class.dart';
import '../list_movie_model/list_movie_model.dart';

class ListMovieProvider extends ProviderClass {
  Future<ListMovieModel> getListMovie() async {
    var response = await requestGetToNetwork("/api/v1/movies");
    var model = ListMovieModel.fromJson(response);

    return model;
  }
}
