import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:netflix_clone/application/bloc/downloads_bloc.dart';
import 'package:netflix_clone/application/fast_laugh/bloc/fast_laugh_bloc.dart';
import 'package:netflix_clone/application/search/searchbloc/search_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/domain/core/di/injectable.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new_service.dart';
import 'package:netflix_clone/presentation/main_page/screen_main_page.dart';

import 'application/hot_and_new/bloc/hotand_new_bloc_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await conifigureInjection();
  //configureDependencies(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DownloadsBloc>(),
          child: Container(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
          child: Container(),
        ),
        BlocProvider(
          create: (context) => getIt<FastLaughBloc>(),
          child: Container(),
        ),
         BlocProvider(
          create: (context) => getIt<HotandNewBlocBloc>(),
          child: Container(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: backgroundColor,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(background: Colors.black),
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white)),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
void configureDependencies() {
  final sl = GetIt.instance;

  // Register your HotandNewBlocBloc with HotNewService dependency
  sl.registerFactory<HotandNewBlocBloc>(() => HotandNewBlocBloc(sl<HotNewService>()));
}





