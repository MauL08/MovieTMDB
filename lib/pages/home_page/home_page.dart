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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(12, 32, 12, 32),
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
              Obx(
                () => state.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
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
                              ),
                              subtitle: Text(
                                'Rating ${state.data.value.results?[index].voteAverage.toString()}',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
