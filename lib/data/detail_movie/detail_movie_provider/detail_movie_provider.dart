import 'package:movieapp/core/class/provider_class.dart';
import '../detail_movie_model/detail_movie_model.dart';

class DetailMovieProvider extends ProviderClass {
  Future<ListDetailMovieModel> getDetailMovieList(int movieId) async {
    var response = await requestGetToNetwork('/api/v1/movies/$movieId');
    var model = ListDetailMovieModel.fromJson(response);

    return model;
  }
}
