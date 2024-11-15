import 'package:flutter/material.dart';
import 'movie_detail_page.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> _favorites = [
      {
        'title': 'ARM',
      'releaseDate': '2024-09-22',
      'posterPath': 'https://assets.telegraphindia.com/telegraph/2024/Aug/1724666328_arm.jpg'
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: _favorites.length,
        itemBuilder: (context, index) {
          final movie = _favorites[index];
          return ListTile(
            leading: Image.network(movie['posterPath']!),
            title: Text(movie['title']!),
            subtitle: Text(movie['releaseDate']!),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailPage(movie: movie),
              ),
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'movie_detail_page.dart';
// //import 'favorites_service.dart';

// class FavoritesPage extends StatefulWidget {
//   @override
//   _FavoritesPageState createState() => _FavoritesPageState();
// }

// class _FavoritesPageState extends State<FavoritesPage> {
//   List<Map<String, String>> _favorites = [];

//   @override
//   void initState() {
//     super.initState();
//    // _loadFavorites();
//   }

//   // void _loadFavorites() async {
//   //   final favorites = await FavoritesService().getFavorites();
//   //   setState(() {
//   //     _favorites = favorites;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorites'),
//       ),
//       body: ListView.builder(
//         itemCount: _favorites.length,
//         itemBuilder: (context, index) {
//           final movie = _favorites[index];
//           return ListTile(
//             leading: Image.network(movie['posterPath']!),
//             title: Text(movie['title']!),
//             subtitle: Text(movie['releaseDate']!),
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => MovieDetailPage(movie: movie),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
