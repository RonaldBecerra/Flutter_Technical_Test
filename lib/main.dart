import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/movie_list/movie_list_bloc.dart';
import 'blocs/movie_list/movie_list_event.dart';
import 'blocs/movie_list/movie_list_state.dart';
import 'repositories/movie_repository.dart';
import 'views/feed_view.dart';
import 'views/detail_view.dart';
import 'views/profile_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieListBloc>(
          create: (context) => MovieListBloc(MovieRepository()),
        ),
        // Añade otros BlocProviders aquí
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Movie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'BalooTamma2',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FeedView(),
      ),
    );
  }
}