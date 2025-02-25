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
      // Extend the body behind the AppBar to achieve full background
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95.0),
        child: Container(
          margin: EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          child: AppBar(
            // Transparent background for the internal AppBar
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,  // No shadow
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Return to previous view
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
          //TODO: Use the tap to show the movie information
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