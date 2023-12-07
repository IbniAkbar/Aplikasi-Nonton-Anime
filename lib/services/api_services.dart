import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiOngoing {
  final String apiUrl =
      "https://apianime-b230b-default-rtdb.firebaseio.com/anime.json";

  Future<Map<String, dynamic>> fetchOngoingData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Berhasil mendapatkan response dari API
      Map<String, dynamic> data = json.decode(response.body);

      // Mengambil data ongoing anime
      Map<String, dynamic> ongoingAnime = data['ongoing'];

      return ongoingAnime;
    } else {
     
      throw Exception('Failed to load anime data');
    }
  }
}

class ApiAdventure {
  final String apiUrl =
      "https://apianime-b230b-default-rtdb.firebaseio.com/anime.json";

  Future<Map<String, dynamic>> fetchAdventureData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
     
      Map<String, dynamic> data = json.decode(response.body);

      Map<String, dynamic> adventureAnime = data['adventure'];

      return adventureAnime;
    } else {
     
      throw Exception('Failed to load anime data');
    }
  }
}

class ApiMovie {
  final String apiUrl =
      "https://apianime-b230b-default-rtdb.firebaseio.com/anime.json";

  Future<Map<String, dynamic>> fetchMovieData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
     
      Map<String, dynamic> data = json.decode(response.body);

      Map<String, dynamic> movieAnime = data['movie'];

      return movieAnime;
    } else {
     
      throw Exception('Failed to load anime data');
    }
  }
}

class ApiSport {
  final String apiUrl =
      "https://apianime-b230b-default-rtdb.firebaseio.com/anime.json";

  Future<Map<String, dynamic>> fetchSportData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Berhasil mendapatkan response dari API
      Map<String, dynamic> data = json.decode(response.body);

      // Mengambil data ongoing anime
      Map<String, dynamic> sportAnime = data['sport'];

      return sportAnime;
    } else {
     
      throw Exception('Failed to load anime data');
    }
  }
}