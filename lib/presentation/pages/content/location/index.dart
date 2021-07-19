import 'package:flutter/material.dart';
import 'package:red_egresados/data/services/location.dart';
import 'package:red_egresados/domain/models/location.dart';
import 'package:red_egresados/domain/services/misiontic_interface.dart';
import 'widgets/location_card.dart';

class UsersLocation extends StatefulWidget {
  // UsersOffers empty constructor
  UsersLocation({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<UsersLocation> {
  late MisionTicService service;
  late Future<List<UserLocation>> futureLocations;
  late MyLocation location;

  @override
  void initState() {
    super.initState();
    service = LocationService();
    location = MyLocation(
        name: "Me",
        id: "bxjgsuO0i9a8fMvP4inmdGl9F1h2",
        lat: 11.019183,
        long: -74.85077234);
    futureLocations = service.fecthData(
      map: location.toJson,
    ) as Future<List<UserLocation>>;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LocationCard(
          title: 'MI UBICACIÓN',
          lat: 11.004556423794284,
          long: -74.7217010498047,
          onUpdate: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'CERCA DE MÍ',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        // ListView on remaining screen space
        Expanded(
          child: FutureBuilder<List<UserLocation>>(
            future: futureLocations,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    UserLocation location = items[index];
                    return LocationCard(
                      title: location.name,
                      distance: location.distance,
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
