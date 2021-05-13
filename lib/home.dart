import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_lisy/model/movie.dart';
class MovieListView extends StatelessWidget {
  final List<Movie> movieList= Movie.getMovies();
  final List movies =[
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
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
        itemCount: movieList.length,
          itemBuilder: (BuildContext context,int index){
          return Stack(children:<Widget>[
             movieCard(movieList[index], context),
            Positioned(
              top:10,
                child: movieImage(movieList[index].images[0])),

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
  Widget movieCard(Movie movie,BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,
            bottom: 8.0,
            left: 54.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Text(movie.title),
                    Text("Rating: ${movie.imdbrating}/10")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Released:${movie.released}"),
                    Text(movie.runtime),
                    Text(movie.rated),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
      onTap: ()=> {Navigator.push(context , MaterialPageRoute(
      builder: (context)=> MovieListDetails(movieName: movie.title,
                movie:movie ,)))},
    );
  }
  Widget movieImage(String imageUrl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ??'https://images-na.ssl-images-amazon.com/images/M/MV5BMTU0NzQ0OTAwNl5BMl5BanBnXkFtZTgwMDAyMzA1OTE@._V1_SX1500_CR0,0,1500,999_AL_.jpg'),)

      ) ,);

  }
}

//New Route
class MovieListDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListDetails({Key key, this.movieName,this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title : Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
        body : Center(
          child: Container(
            child: RaisedButton(
              child: Text("Go Back ${ this.movie.director} "),
              onPressed: (){
                Navigator.pop(context);

              },
            )
          ),
        )

      );
  }
}
