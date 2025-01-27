// import 'package:flutter/material.dart';
// import 'package:trugether_frontend/explore/dto/dataconvert.dart';
// import 'package:trugether_frontend/explore/music/musicplayer.dart';
// import 'package:trugether_frontend/explore/services/savn_api.dart';

// class SongSearchPage extends StatefulWidget {
//   @override
//   _SongSearchPageState createState() => _SongSearchPageState();
// }

// class _SongSearchPageState extends State<SongSearchPage> {
//   final TextEditingController _searchController = TextEditingController();
//   List<Song> _songs = [];
//   bool _isLoading = false;
//   String? _errorMessage;

//   void _searchSongs(String query) async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });

//     try {
//       final apiService = ApiService(query);
//       final response = await apiService.fetchSongs();

//       if (response.success && response.data.results.isNotEmpty) {
//         setState(() {
//           _songs = response.data.results;
//         });
//       } else {
//         setState(() {
//           _errorMessage = 'No songs found for "$query".';
//           _songs = [];
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'An error occurred: $e';
//         _songs = [];
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Song Search')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _searchController,
//                     decoration: const InputDecoration(
//                       hintText: 'Enter song name...',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 ElevatedButton(
//                   onPressed: () {
//                     final query = _searchController.text.trim();
//                     if (query.isNotEmpty) {
//                       _searchSongs(query);
//                     }
//                   },
//                   child: const Text('Search'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             if (_isLoading)
//               const Center(child: CircularProgressIndicator())
//             else if (_errorMessage != null)
//               Center(
//                 child: Text(
//                   _errorMessage!,
//                   style: const TextStyle(color: Colors.red),
//                   textAlign: TextAlign.center,
//                 ),
//               )
//             else if (_songs.isEmpty)
//               const Center(child: Text('No songs found.'))
//             else
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: _songs.length,
//                   itemBuilder: (context, index) {
//                     final song = _songs[index];
//                     return Card(
//                       child: ListTile(
//                         leading:
//                             (song.image.isNotEmpty &&
//                                     song.image.first.url.isNotEmpty)
//                                 ? Image.network(
//                                   song.image.first.url,
//                                   width: 50,
//                                   height: 50,
//                                   fit: BoxFit.cover,
//                                   errorBuilder: (context, error, stackTrace) {
//                                     return const Icon(Icons.broken_image);
//                                   },
//                                 )
//                                 : const Icon(Icons.music_note),
//                         title: Text(song.name),
//                         subtitle: Text(
//                           'Artist: ${song.artists.primary.isNotEmpty ? song.artists.primary.first.name : "Unknown"}\n'
//                           'Duration: ${song.duration != null ? "${song.duration} sec" : "Unknown"}',
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder:
//                                   (context) => Musicplayer(
//                                     songUrl: song.downloadUrl.first.url,
//                                     imageUrl: song.image.last.url,
//                                   ),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
