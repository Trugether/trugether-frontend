import 'package:flutter/material.dart';
import 'package:trugether_frontend/explore/dto/dataconvert.dart';
import 'package:trugether_frontend/explore/music/musicplayer.dart';
import 'package:trugether_frontend/explore/services/savn_api.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Song> _songs = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _searchSongs(String query) async {
    print("inside searhsongs method");
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      print("inside try block");
      final apiService = ApiService(query);
      final response = await apiService.fetchSongs();

      if (response.success && response.data.results.isNotEmpty) {
        setState(() {
          _songs = response.data.results;
        });
      } else {
        setState(() {
          _errorMessage = 'No songs found for "$query".';
          _songs = [];
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: $e';
        _songs = [];
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Explore", style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Search bar
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      prefixIconColor: Colors.white,
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: "Song name",
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 20,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ), // Add some spacing between TextField and Button
                // Search button
                ElevatedButton(
                  onPressed: () {
                    print("Search button clicked");
                    final query = _searchController.text.trim();
                    if (query.isNotEmpty) {
                      print("Inside if block");
                      _searchSongs(query);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Search",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_errorMessage != null)
              Center(
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              )
            else if (_songs.isEmpty)
              const Center(child: Text('No songs found.'))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _songs.length,
                  itemBuilder: (context, index) {
                    final song = _songs[index];
                    return Card(
                      child: ListTile(
                        leading:
                            (song.image.isNotEmpty &&
                                    song.image.first.url.isNotEmpty)
                                ? Image.network(
                                  song.image.first.url,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.broken_image);
                                  },
                                )
                                : const Icon(Icons.music_note),
                        title: Text(song.name),
                        subtitle: Text(
                          'Artist: ${song.artists.primary.isNotEmpty ? song.artists.primary.first.name : "Unknown"}\n'
                          'Duration: ${song.duration != null ? "${song.duration} sec" : "Unknown"}',
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => Musicplayer(
                                    songUrl: song.downloadUrl.first.url,
                                    imageUrl: song.image.last.url,
                                  ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
