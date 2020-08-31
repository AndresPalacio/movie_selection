import 'package:flutter/material.dart';
import 'package:movie_ticker/movie_ticker/constants.dart';
import 'package:movie_ticker/movie_ticker/models/actors.dart';
import 'package:movie_ticker/movie_ticker/models/movie.dart';

class Synopsis extends StatelessWidget {
  final String description;

  const Synopsis({Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Synopsis",
          style: kMovieTextStyle.copyWith(
            fontSize: size.height * .035,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.justify,
          style: kMovieTextStyle.copyWith(
              fontSize: size.height * .022,
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: kPrimaryColorLight),
        ),
      ],
    );
  }
}

class MovieMainDetails extends StatelessWidget {
  const MovieMainDetails({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .22,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              movie.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildInfoText('Genre:', movie.tags.first, size),
                buildInfoText('Duration:',
                    movie.duration.inMinutes.toString() + ' min', size),
                buildInfoText('Release year:', movie.year, size),
                buildInfoText('Director:', movie.director, size),
                buildInfoText('Writer:', movie.writer, size),
                const SizedBox(),
                const SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  Text buildInfoText(String title, String subtitle, Size size) {
    return Text.rich(
      TextSpan(text: title, children: [
        TextSpan(
            text: '  $subtitle',
            style: TextStyle(
              color: Colors.white,
            ))
      ]),
      maxLines: 1,
      style: kMovieTextStyle.copyWith(
        color: kPrimaryColorLight,
        fontWeight: FontWeight.w500,
        fontSize: size.height * .021,
      ),
    );
  }
}

class TopBorderedContainer extends StatelessWidget {
  const TopBorderedContainer({
    Key key,
    @required this.movie,
    this.child,
  }) : super(key: key);

  final Movie movie;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeIcon = size.height * .035;

    final textStyle = kMovieTextStyle.copyWith(
      fontSize: sizeIcon * .75,
      fontWeight: FontWeight.w500,
    );
    return Container(
      width: double.infinity,
      height: size.height * .11,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 40,
          )
        ],
        color: kPrimaryColor,
      ),
      child: child == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: sizeIcon,
                      color: Colors.white60,
                    ),
                    Text(
                      movie.likes.toString(),
                      style: textStyle,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TagContainer(
                      tag: '  IDMB  ',
                      gradient: LinearGradient(
                        colors: [Colors.yellow, Colors.orangeAccent],
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      movie.rate.toString(),
                      style: textStyle,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: sizeIcon,
                      color: Colors.white60,
                    ),
                    Text(
                      movie.dislikes.toString(),
                      style: textStyle,
                    ),
                  ],
                )
              ],
            )
          : child,
    );
  }
}

class TagContainer extends StatelessWidget {
  const TagContainer({
    Key key,
    this.tag,
    this.gradient = kGradientRedOrange,
  }) : super(key: key);
  final String tag;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Text(
        tag.toUpperCase(),
        style: kMovieTextStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), gradient: gradient),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    this.text,
    this.onTap,
    this.width,
  }) : super(key: key);

  final String text;
  final double width;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        alignment: Alignment.center,
        height: size.height * .07,
        width: width ?? size.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
              )
            ],
            borderRadius: BorderRadius.circular(8),
            gradient: kGradientRedOrange),
        child: Text(
          text,
          style: kMovieTextStyle.copyWith(
              fontSize: size.height * .027,
              fontWeight: FontWeight.w500,
              letterSpacing: 4),
        ),
      ),
    );
  }
}

class ActorsList extends StatelessWidget {
  const ActorsList({
    Key key,
    this.listActors,
  }) : super(key: key);

  final List<Actor> listActors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Actors",
            style: kMovieTextStyle.copyWith(
              fontSize: size.height * .035,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: size.height * .2,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: listActors.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        listActors[i].pathImage,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: Text(
                        listActors[i].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kMovieTextStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.white.withOpacity(.9),
                          fontSize: size.height * .024,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
