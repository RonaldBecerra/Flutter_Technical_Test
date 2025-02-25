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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(95.0),
        child: Container(
          margin: const EdgeInsets.only(
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
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w500${widget.movie.posterPath}'),
            fit: BoxFit.cover,
          ),
        ),
        child: hasTapped
          ? Text(
              "Ya tapeé",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )
          : Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    hasTapped = true;
                    BlocProvider.of<MovieDetailBloc>(context).add(FetchMovieDetail(widget.movie.id));
                  });
                },
              ),
        ),
      ),
    );
  }
}