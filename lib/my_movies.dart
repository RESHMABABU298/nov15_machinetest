import 'package:flutter/material.dart';
import 'favorites_page.dart';
import 'movieshow.dart';

class MyMovies extends StatefulWidget {
  const MyMovies({super.key});

  @override
  State<MyMovies> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyMovies> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _movies = [
    {
      
      'title': 'Premalu',
      'releaseDate': '2023-09-22',
      'posterPath': 'https://upload.wikimedia.org/wikipedia/en/thumb/c/c5/Premalu_film_poster.jpg/220px-Premalu_film_poster.jpg'
    },
    {

      'title': 'ARM',
      'releaseDate': '2024-09-22',
      'posterPath': 'https://assets.telegraphindia.com/telegraph/2024/Aug/1724666328_arm.jpg'
    },
    {
      'title': 'Minnal Murali',
      'releaseDate': '2022-11-15',
      'posterPath': 'https://media.assettype.com/cinemaexpress%2Fimport%2F2020%2F8%2F25%2Foriginal%2FMinnal_Murali.jpeg?w=480&auto=format%2Ccompress&fit=max'
    },
    {
      'title': 'RRR',
      'releaseDate': '2022-07-12',
      'posterPath': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6kJNFSGlfp3uTDthjWaEl10peYbREtTtOJWuRVZM7laAg-dzbtNDr2qUrmNwLF5uShrY&usqp=CAU'
    }
  ];

  List<Map<String, String>> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
  }

  void _searchMovies(String query) {
    final results = _movies.where((movie) {
      final titleLower = movie['title']!.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      _filteredMovies = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Search'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LikeMovies()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search for a movie...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchMovies(_controller.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMovies.length,
              itemBuilder: (context, index) {
                final movie = _filteredMovies[index];
                return ListTile(
                  leading: Image.network(movie['posterPath']!),
                  title: Text(movie['title']!),
                  subtitle: Text(movie['releaseDate']!),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieShow(movie: movie),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
