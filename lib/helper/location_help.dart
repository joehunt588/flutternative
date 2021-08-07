//this use mapBox
// const apiKey =
//     'pk.eyJ1Ijoiam9laHVudDU4OCIsImEiOiJja2xrdmc3cjUydXk1MnBtbG16azV5M2s4In0.F6kViseXN3BLaAXRMTU0sg';

// class LocationHelper {
//   static String generatePreviewImageUrl({double latitude, double longitude}) {
//     return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-l($longitude,$latitude)/$longitude,$latitude,14.25,0,0/600x300?access_token=$apiKey';
//   }
// }

import 'package:http/http.dart' as http;
import 'dart:convert';

//use google map
const apiKey = 'AIzaSyDgLHfF1C6VHNx5jRI_UQDSppOsEQeKPk4';

class LocationHelper {
  static String generatePreviewImageUrl({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$apiKey';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$lat,$lng&key=$apiKey';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
