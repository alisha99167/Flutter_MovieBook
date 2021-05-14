import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_lisy/model/movie.dart';

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
            // return Card(
            //   elevation: 4.5,
            //
            //   color:Colors.white,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Center(
            //         child: Container(
            //           width: 200,
            //           height: 200,
            //           decoration: BoxDecoration(
            //             image: DecorationImage(
            //               image: NetworkImage(movieList[index].images[0]),
            //               fit: BoxFit.cover
            //             ),
            //             color: Colors.blue,
            //             borderRadius: BorderRadius.circular(13.9)
            //           ),
            //           child: null,
            //         ),
            //       ),
            //     ),
            //     trailing: Text("...."),
            //     title: Text(movieList[index].title),
            //       subtitle: Text("${ movieList[0].title}"),
            //       onTap:() {
            //       Navigator.push(context , MaterialPageRoute(
            //            builder: (context)=> MovieListDetails(movieName: movieList.elementAt(index).title,
            //            movie:movieList[index] ,)));
            //   },
            //   ),
            //
            // );
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
          MovieDetailsHeaderWithPoster(movie: movie)
        ],
      ),
      // body : Center(
      //   child: Container(
      //     child: RaisedButton(
      //       child: Text("Go Back ${ this.movie.director} "),
      //       onPressed: (){
      //         Navigator.pop(context);
      //
      //       },
      //     )
      //   ),
      // )
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail), fit: BoxFit.cover)),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors:[Color(0x00f5f5f5),Color(0xfff5f5f5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
          ),
          height: 80,
        )
      ],
    );
  }
}
class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({Key key,this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: <Widget>[
        MoviePoster(poster:movie.images[0].toString())
      ],),
    );
  }
}
class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({Key key,this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius=BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius : borderRadius,
      child: Container(
        width: MediaQuery.of(context).size.width/4,
        height: 160,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(poster),
            fit: BoxFit.cover
          )
        ),
      ),),
    );
  }
}
