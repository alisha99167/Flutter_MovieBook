
import 'package:flutter/material.dart';

import '../movie.dart';
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

              height: 170,

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
              gradient: LinearGradient(
                  colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          MoviePoster(poster: movie.images[0].toString()),
          SizedBox(
            width: 16,
          ),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(

        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${movie.year} .${movie.genre}".toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Colors.indigoAccent),
          ),
          Text(
            movie.title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
          ),
          Text.rich(TextSpan(
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
              children: <TextSpan>[
                TextSpan(text: movie.plot),
                TextSpan(
                    text: "More...",
                    style: TextStyle(color: Colors.indigoAccent))
              ]))
        ]);
  }
}
class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key,this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField(field:"Cast",value:movie.actors),
          MovieField(field:"Directors" ,value:movie.director),
          MovieField(field:"Directors",value:movie.award)
        ],
      ),
    );
  }
}


class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({Key key,this.value,this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$field: ",style: TextStyle(
            color: Colors.black38,
            fontSize: 12,fontWeight: FontWeight.w300
        ),),
        Expanded(
          child: Text(value,style: TextStyle(
              color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300
          ),),
        )
      ],
    );
  }
}
class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 12),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}
class MovieDetailsExtraPoster extends StatelessWidget {
  final List <String> posters;
  const MovieDetailsExtraPoster({Key key,this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("More movie posters".toUpperCase(),
            style: TextStyle(
              color: Colors.black26,
              fontSize: 14,
            ),),
        ),
        Container(
          height:170,
          padding:EdgeInsets.symmetric(vertical:16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,

              separatorBuilder: (context,index)=>SizedBox(width: 8,),
              itemCount: posters.length,
              itemBuilder: (context,  index)=> ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(image:NetworkImage(posters[index]),
                            fit:BoxFit.cover)
                    ),
                  )
              )),
        )
      ],
    );
  }
}
