import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moviesapp/helpers.dart/theme_service.dart';
import 'package:moviesapp/pages/home.dart';
import 'package:moviesapp/services/api_service.dart';

import 'helpers.dart/theme.dart';
void main() async {
   await GetStorage.init(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
          
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // add this
      title: 'Material App',
      initialRoute: 'home',
      // routes: {
      //   'pagina1': (_) => Pagina1Page(),
      //   'pagina2': (_) => Pagina2Page()
      // },
      getPages: [
        // GetPage(name: 'pagina1', page: () => Pagina1Page()),
        // GetPage(name: 'pagina2', page: () => Pagina2Page()),
        GetPage(name: '/home', page: () => Home()),
        // GetPage(name: '/api', page: () => ApiService())
      ] ,
    );
  }
}
