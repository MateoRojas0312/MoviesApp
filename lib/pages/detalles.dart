import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/controllers/movie_controller.dart';
import 'package:moviesapp/models/result.dart';

class Detalles extends GetView<MovieController> {
  final Result result;
  Detalles(this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieController moviesCtrl = Get.put(MovieController());
    moviesCtrl.getCast(result.id);
    // moviesCtrl.getGenre(result.id);

    var index;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${result.posterPath}',
                      fit: BoxFit.cover),
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    // color: Color(0xFF283546),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            '${result.title}',
                            style: GoogleFonts.getFont('Poppins', fontSize: 25
                                //color: Colors.white
                                ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(2),
                                    shape: MaterialStateProperty.all(
                                        StadiumBorder()),
                                   
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 40,
                                    child: Center(
                                      child: Text(
                                        'Watch now',
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          // color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {}),
                            ),
                            Padding(  
                              padding: const EdgeInsets.fromLTRB(120, 10, 0, 0),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(1),
                                    shape: MaterialStateProperty.all(
                                        StadiumBorder()),
                                   
                                  )
                                  ,
                                  child: Text(
                                    'Light/Dark',
                                  ),
                                  onPressed: () {
                                    Get.isDarkMode
                                        ? Get.changeTheme(ThemeData.light())
                                        : Get.changeTheme(ThemeData.dark());
                                  }),
                            ),
                          ],
                        ),
                        Container(
                          width: 400,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(
                              '${result.overview}',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.openSans(
                                fontSize: 15,
                                //color: Color(0XFF6B7480)
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 170,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 70,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/w200/${moviesCtrl.cast[index].profilePath}',
                                            fit: BoxFit.cover,
                                          ),

                                          //CircleAvatar()
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 0, 0, 0),
                                        child: Text(
                                          '${moviesCtrl.cast[index].name}',
                                          style: GoogleFonts.roboto(
                                              // color: Color(0xFF6b7480),
                                              ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 30.0,
                                );
                              },
                              itemCount: moviesCtrl.cast.length,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 60,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      'Promedio :',
                                      style: GoogleFonts.roboto(
                                          // color: Colors.white,
                                           fontSize: 16
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    child: Text(
                                      '${result.voteAverage}',
                                      style: GoogleFonts.roboto(
                                        //  color: Color(0xFF6B7480),
                                          fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
