import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_lisy/model/movie.dart';

import 'model/movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Avatar",
    "I am Legend",
    "300",
    "The Avengers",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game Of Thrones",
    "Vikings",
    "Gotham",
    "Power",
    "Narcos",
    "Breaking Bad",
  ];

  // const MovieListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(
                  top: 10, child: movieImage(movieList[index].images[0])),
            ]);

          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "Rating: ${movie.imdbrating}/10",
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Released:${movie.released}",
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      ),
                      Text(
                        movie.runtime,
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      ),
                      Text(
                        movie.rated,
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListDetails(
                      movieName: movie.title,
                      movie: movie,
                    )))
      },
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(imageUrl ??
                'https://images-na.ssl-images-amazon.com/images/M/MV5BMTY2ODQ3NjMyMl5BMl5BanBnXkFtZTcwODg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg'),
          )),
    );
  }
}

//New Route
class MovieListDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[

          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie,),
          HorizontalLine(),
          MovieDetailsExtraPoster(posters: movie.images,)
        ],
      ),

    );
  }
}


