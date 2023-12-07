// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum2/Adventure.dart';
import 'package:praktikum2/detail_page.dart';
import 'package:praktikum2/movie.dart';
import 'package:praktikum2/sport.dart';
import 'package:praktikum2/widget/category.dart';
import 'package:praktikum2/models/model.dart';
import 'package:praktikum2/services/api_services.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiOngoing _apiOngoing = ApiOngoing();
  late Map<String, dynamic> _ongoingData;
  List<AnimeModel> _filteredAnimeList = [];

  @override
  void initState() {
    super.initState();
    _fetchAnimeData();
  }

  Future<void> _fetchAnimeData() async {
    try {
      _ongoingData = await _apiOngoing.fetchOngoingData();
      _filteredAnimeList.addAll(_ongoingData.entries
          .map((entry) => AnimeModel.fromJson(entry.key, entry.value))
          .toList());
      setState(() {});
    } catch (e) {
      // Handle error
      print('Error fetching anime data: $e');
    }
  }

  void _filterAnimeList(String query) {
    _filteredAnimeList.clear();
    if (query.isEmpty) {
      _filteredAnimeList.addAll(_ongoingData.entries
          .map((entry) => AnimeModel.fromJson(entry.key, entry.value))
          .toList());
    } else {
      _filteredAnimeList.addAll(
        _ongoingData.entries
            .map((entry) => AnimeModel.fromJson(entry.key, entry.value))
            .where(
              (anime) => anime.nameanime.toLowerCase().contains(query.toLowerCase()),
            )
            .toList(),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage("assets/images/HandlerOne.jpg"),
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Mau Nonton Anime Apa Hari Ini?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            cursorHeight: 20,
                            autofocus: false,
                            onChanged: (query) {
                              _filterAnimeList(query);
                            },
                            decoration: InputDecoration(
                              hintText: "Cari Anime",
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  children: [
                    category(
                      imagePath: "assets/images/sport.png",
                      title: "Sport",
                      detail: SportPage(),
                    ),
                    category(
                      imagePath: "assets/images/movie.png",
                      title: "Movie",
                      detail: MoviePage(),
                    ),
                    category(
                      imagePath: "assets/images/adventure1.png",
                      title: "Adventure",
                      detail: AdventurePage(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Anime On Going",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildAnimeList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimeList() {
    if (_filteredAnimeList.isEmpty) {
      return const Center(
        child: Text('No matching anime found.'),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _filteredAnimeList.length,
        itemBuilder: (context, index) {
          AnimeModel anime = _filteredAnimeList[index];
          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 10,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(anime.nameanime, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Rating: ${anime.ratinganime}'),
                  Text('Episode: ${anime.episodeanime}'),
                ],
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  anime.imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(anime: anime,),
                  ),
                );
              },
            ),
          );
        },
      );
    }
  }
}
