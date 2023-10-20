import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum2/widget/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Tersimpan"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
        ],
      ),
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
                                      image:
                                          AssetImage("assets/images/profil.png"),
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 2)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Mau Nonton Anime Apa Hari Ini?",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: const Icon(
                            Icons.notifications_active,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
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
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                          cursorHeight: 20,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: "Cari Anime",
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  category(
                      imagePath: "assets/images/ongoing.png", title: "On Going"),
                  category(imagePath: "assets/images/action.png", title: "Aksi"),
                  category(
                      imagePath: "assets/images/shounen.png", title: "Shounen"),
                  category(
                      imagePath: "assets/images/adventure1.png",
                      title: "Adventure")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Anime Favorit",
                style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold, ),
              ),
            ),
            const ListAnime(imagePath: "assets/images/onepiece.jpg", nameanime: "ONE PIECE", ratinganime: "9,7", episodeanime: "1087 Episode",),
            const ListAnime(imagePath: "assets/images/KNY.jpg", nameanime: "KIMETSU NO YAIBA", ratinganime: "9,5", episodeanime: "45 Episode"),
            const ListAnime(imagePath: "assets/images/haikyu.jpg", nameanime: "HAIKYU", ratinganime: "8,9", episodeanime: "85 Episode"),
            const ListAnime(imagePath: "assets/images/naruto.jpg", nameanime: "NARUTO SHIPPUDEN", ratinganime: "9,5", episodeanime: "500 Episode"),
            const ListAnime(imagePath: "assets/images/horimiya.jpg", nameanime: "HORIMIYA", ratinganime: "9", episodeanime: "13 Episode")
            
          ],
        )),
      ),
    );
  }
}

class ListAnime extends StatelessWidget {
  final String imagePath;
    final String nameanime;
    final String ratinganime;
    final String episodeanime;
  const ListAnime({
    super.key,
    required this.imagePath,
    required this.nameanime,
    required this.ratinganime,
    required this.episodeanime,
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
        width: double.infinity,
        height: 240,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nameanime, style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.bold),),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellowAccent,
                          ),
                          const SizedBox(width: 5,),
                          Text(ratinganime),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(Icons.save, color: Colors.grey,),
                          const SizedBox(width: 5,),
                          Text(episodeanime),
                          
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
