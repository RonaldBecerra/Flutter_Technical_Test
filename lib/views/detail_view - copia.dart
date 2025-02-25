import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_test/models/movie.dart';
import 'package:flutter_technical_test/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:flutter_technical_test/blocs/movie_detail/movie_detail_event.dart';
import 'package:flutter_technical_test/blocs/movie_detail/movie_detail_state.dart';

class DetailView extends StatefulWidget {
  final Movie movie;

  const DetailView({
    required this.movie,
    super.key,
  });

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool hasTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95.0),
        child: Container(
          margin: EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.only(left: 25.0),
                child: const Image(
                  image: AssetImage('assets/icons/close_icon.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            hasTapped = true;
            BlocProvider.of<MovieDetailBloc>(context).add(FetchMovieDetail(widget.movie.id));
          });
        },
        child: hasTapped
            ? BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://image.tmdb.org/t/p/w500${widget.movie.posterPath}'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else if (state is MovieDetailLoaded) {
              return GestureDetector(
                onTap: () {
                  // Muestra los detalles de la película
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://image.tmdb.org/t/p/w500${state.movie.posterPath}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            } else if (state is MovieDetailError) {
              return Center(child: Text(state.error));
            }
            return const SizedBox.shrink();
          },
        )
            : Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/w500${widget.movie.posterPath}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}