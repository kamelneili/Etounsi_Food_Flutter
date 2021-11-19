import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kamelfoodapp/blocs/autocomplete/autocomplete-state.dart';
import 'package:kamelfoodapp/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:kamelfoodapp/blocs/autocomplete/autocomplete_event.dart';
import 'package:kamelfoodapp/blocs/geolocation/geolocation_bloc.dart';
import 'package:kamelfoodapp/blocs/geolocation/geolocation_event.dart';
import 'package:kamelfoodapp/blocs/geolocation/geolocation_state.dart';
import 'package:kamelfoodapp/screens/widgets/gmap.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    BlocProvider.of<GeolocationBloc>(context).add(LoadGeolocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("location")),
        body: Stack(
          children: [
            BlocBuilder<GeolocationBloc, GeolocationState>(
                builder: (context, state) {
              if (state is GeolocationLoading)
                //   return Center(child: CircularProgressIndicator());
                return Center(child: Text("CircularProgressIndicator"));
              else if (state is GeolocationLoaded) {
                return Gmap(
                    lat: state.position.latitude,
                    leng: state.position.longitude);
              } else
                return Text("something were wrong");
            }),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your Location',
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    context
                        .read<AutocompleteBloc>()
                        .add(LoadAutocomplete(searchInput: value));
                    print("changed");
                  },
                ),
                BlocBuilder<AutocompleteBloc, AutocompleteState>(
                  builder: (context, state) {
                    if (state is GeolocationLoading)
                      return Center(child: CircularProgressIndicator());
                    else if (state is AutocompleteLoaded)
                      return Container(
                          margin: const EdgeInsets.all(8),
                          height: 300,
                          color: Colors.black.withOpacity(0.6),
                          child: ListView.builder(
                              itemCount: state.autocomplete.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(
                                  // "kml",
                                  state.autocomplete[index].description,
                                  style: TextStyle(color: Colors.white),
                                ));
                              }));
                    else
                      return Text("something where wrong");
                    //
                  },
                ),
              ],
            )
          ],
        ));
  }
}
