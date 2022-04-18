import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/pages/home_page/home_state.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeState state = Get.put(HomeState());

  @override
  Widget build(BuildContext context) {
    state.getListMovieData();

    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: Obx(
        () => state.loading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(12, 48, 12, 12),
                  child: Column(
                    children: [
                      Text(
                        'TMDB MOVIES',
                        style: TextStyle(
                          color: Colors.blue.shade800,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Image.network(
                                state.data.value.results?[index].posterPath ??
                                    '',
                                fit: BoxFit.fill,
                              ),
                              title: Text(
                                state.data.value.results?[index].title ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Container(
                                margin: const EdgeInsets.only(
                                  top: 8,
                                ),
                                child: Text(
                                  'Rating ${state.data.value.results?[index].voteAverage.toString()}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              trailing: const Icon(Icons.arrow_forward),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Colors.transparent,
                          );
                        },
                        itemCount: state.data.value.results!.length,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
