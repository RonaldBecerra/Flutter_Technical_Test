import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/movie.dart';

class DetailView extends StatelessWidget {
  final Movie movie;

  const DetailView({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,  // Extiende el cuerpo detrás del AppBar para lograr el fondo total
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,  // Sin sombra
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();  // Regresa a la vista anterior
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // Aquí puedes manejar el tap para mostrar la información de la película
          // Haandle
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}