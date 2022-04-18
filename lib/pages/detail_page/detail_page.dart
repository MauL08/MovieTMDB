import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/pages/detail_page/detail_state.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.movieId}) : super(key: key);

  int movieId;

  DetailState state = Get.put(DetailState());

  @override
  Widget build(BuildContext context) {
    state.getDetailMovie(movieId);

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Obx(
        () => state.loading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(12, 48, 12, 12),
                  child: Column(
                    children: [
                      Text(
                        state.data.value.title ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Image.network(
                          state.data.value.posterPath ?? '',
                          height: 400,
                          width: 400,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Text(
                          state.data.value.overview ?? '',
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
