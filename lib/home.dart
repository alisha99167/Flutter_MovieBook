import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_lisy/model/movie.dart';
class MovieListView extends StatelessWidget {
  final List<Movie> movieList= Movie.getMovies();
  final List movies =[
    "Vikings",
    "Shutter Island",
    "Jhon Wick",
    "Fast and Furious",
    "Peaky Blinders",
    "Game of Thrones",
    "Welcome",
    "Coco",
    "Wall-E",
    "Young Sheldon"
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
          return Card(
            elevation: 4.5,

            color:Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(13.9)
                    ),
                    child: Text("h"),
                  ),
                ),
              ),
              trailing: Text("...."),
              title: Text(movieList[index].title),
                subtitle: Text("${ movieList[0].title}"),
                onTap:() {
                Navigator.push(context , MaterialPageRoute(
                     builder: (context)=> MovieListDetails(movieName: movieList.elementAt(index).title,)));
            },
            ),

          );
      }),
    );
  }
}

//New Route
class MovieListDetails extends StatelessWidget {
  final String movieName;

  const MovieListDetails({Key key, this.movieName}) : super(key: key);

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
              child: Text("Go Back ${ this.movieName}  "),
              onPressed: (){
                Navigator.pop(context);

              },
            )
          ),
        )

      );
  }
}
