import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/controllers/movie_controller.dart';
import 'package:get/get.dart';
import 'package:moviesapp/pages/detalles.dart';

class Home extends GetView<MovieController> {
  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final MovieController moviectrl = Get.put(MovieController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, -1),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 270,
                      color: Color(0xFF5ca1d4),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 40),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Hello, what do you want to watch',
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.getFont('Lato',
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF8ebee1),
                                      borderRadius: BorderRadius.circular(13)),
                                  child: TextFormField(
                                    controller: searchTextController,
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.search_rounded,
                                        color: Colors.white,
                                      ),
                                      hintText: 'Search',
                                      hintStyle: GoogleFonts.getFont(
                                        'Lato',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Container(
                      height: 470,
                      decoration: const BoxDecoration(
                        color: Color(0xFF283546),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                            child: Text(
                              'RECOMMENDED FOR YOU',
                              style: GoogleFonts.getFont('Roboto',
                                  color: Colors.white),
                            ),
                          ),
                          Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(25, 15, 0, 0),
                                child: Container(
                                  height: 250,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            width: 120,
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  child: Container(
                                                    height: 180,
                                                    child: GestureDetector(
                                                        child: Image.network(
                                                          'https://image.tmdb.org/t/p/w200/${moviectrl.populars[index].posterPath}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                        onTap: () => Get.to(
                                                            () => Detalles(
                                                                  moviectrl
                                                                          .populars[
                                                                      index],
                                                                ),
                                                            preventDuplicates:
                                                                false)),
                                                  ),
                                                ),
                                                Text(
                                                  '${moviectrl.populars[index].title}',
                                                  style: GoogleFonts.getFont(
                                                      'Poppins',
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                        width: 25,
                                      );
                                    },
                                    itemCount: moviectrl.populars.length,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                child: Text(
                                  'TOP RATED',
                                  style: GoogleFonts.getFont('Roboto',
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(25, 15, 0, 0),
                                child: Container(
                                  height: 250,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            width: 120,
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  child: Container(
                                                    height: 180,
                                                    child: GestureDetector(
                                                        child: Image.network(
                                                          'https://image.tmdb.org/t/p/w200/${moviectrl.topRated[index].posterPath}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                        onTap: () => Get.to(
                                                            () => Detalles(
                                                                  moviectrl
                                                                          .topRated[
                                                                      index],
                                                                ),
                                                            preventDuplicates:
                                                                false)),
                                                  ),
                                                ),
                                                Text(
                                                  '${moviectrl.topRated[index].title}',
                                                  style: GoogleFonts.getFont(
                                                      'Poppins',
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                        width: 25,
                                      );
                                    },
                                    itemCount: moviectrl.topRated.length,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class CustomListview extends StatelessWidget {
//   const CustomListview({
//     Key? key,
//     required this.moviectrl,
//   }) : super(key: key);

//   final MovieController moviectrl;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return Container(
//           height: 50,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(18.0),
//             child: Image.network(
//               'https://image.tmdb.org/t/p/w200/${moviectrl.populars[index].posterPath}',
//               fit: BoxFit.cover,
//             ),
//           ),
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return const SizedBox(
//           width: 25,
//         );
//       },
//       itemCount: moviectrl.populars.length,
//     );
//   }
// }
