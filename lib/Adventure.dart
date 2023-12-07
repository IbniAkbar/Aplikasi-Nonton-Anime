// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:praktikum2/detail_page.dart';
import 'package:praktikum2/models/model.dart';
import 'package:praktikum2/services/api_services.dart';

class AdventurePage extends StatefulWidget {
  @override
  State<AdventurePage> createState() => _AdventurePageState();
}

class _AdventurePageState extends State<AdventurePage> {
  ApiAdventure _apiAdventure = ApiAdventure();
  late Map<String, dynamic> _adventureData;
  List<AnimeModel> _filteredAnimeList = [];

  @override
  void initState() {
    super.initState();
    _fetchAdventureData();
  }

  Future<void> _fetchAdventureData() async {
    try {
      _adventureData = await _apiAdventure.fetchAdventureData();
     _filteredAnimeList.addAll(_adventureData.entries
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
      _filteredAnimeList.addAll(_adventureData.entries
          .map((entry) => AnimeModel.fromJson(entry.key, entry.value))
          .toList());
    } else {
      _filteredAnimeList.addAll(
        _adventureData.entries
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Anime Adventure"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
            _buildAnimeList()
          ]),
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 10,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(anime.nameanime,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
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
