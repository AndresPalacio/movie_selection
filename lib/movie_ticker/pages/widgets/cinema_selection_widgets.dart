import 'package:flutter/material.dart';
import 'package:movie_ticker/movie_ticker/constants.dart';
import 'package:movie_ticker/movie_ticker/models/movie.dart';

class SelectCinema extends StatelessWidget {
  const SelectCinema({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 30,
              )
            ]),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("SELECT YOUR CINEMA",
                    style: kMovieTextStyle.copyWith(
                      color: kPrimaryColorLight,
                      fontSize: size.height * .018,
                      fontWeight: FontWeight.w500,
                    )),
                Text("Gulliver",
                    style: kMovieTextStyle.copyWith(
                      height: 2,
                      fontSize: size.height * .025,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_downward,
              color: Colors.white,
              size: size.height * .03,
            )
          ],
        ));
  }
}

class HourContainer extends StatelessWidget {
  const HourContainer({
    Key key,
    this.hour,
    this.id,
    this.selectedHourNotifier,
    this.onTap,
  }) : super(key: key);
  final String hour;
  final ValueNotifier<int> selectedHourNotifier;
  final int id;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ValueListenableBuilder<int>(
        valueListenable: selectedHourNotifier,
        builder: (context, value, child) {
          final isSelected = value == id;
          return InkWell(
            onTap: () {
              selectedHourNotifier.value = id;
              onTap();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  gradient: isSelected ? kGradientRedOrange : null,
                  boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black38)],
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    hour,
                    style: kMovieTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: size.height * .024,
                      color: isSelected ? Colors.white : kPrimaryColorLight,
                    ),
                  ),
                  Text(
                    "60 MXN",
                    style: kMovieTextStyle.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: size.height * .016,
                      color: isSelected ? Colors.white : kPrimaryColorLight,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class HoursMovieOptions extends StatelessWidget {
  const HoursMovieOptions({
    Key key,
    @required this.listHours,
    @required this.selectedHourNotifier,
    @required this.movie,
  }) : super(key: key);

  final List<String> listHours;
  final ValueNotifier<int> selectedHourNotifier;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.horizontal,
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 2 / 4,
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: List.generate(listHours.length, (i) {
        return HourContainer(
          hour: listHours[i],
          selectedHourNotifier: selectedHourNotifier,
          onTap: () => movie.billboardHour = listHours[i],
          id: i,
        );
      }),
    );
  }
}
