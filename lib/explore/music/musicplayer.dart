import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:trugether_frontend/explore/music/pagemanager.dart';
import 'package:trugether_frontend/home/screens/home_screen.dart';

class Musicplayer extends StatefulWidget {
  final String songUrl; // Parameter for the song URL
  final String imageUrl; // Parameter for the song image URL

  const Musicplayer({super.key, required this.songUrl, required this.imageUrl});

  @override
  State<Musicplayer> createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {
  late final PageManager _pageManager;

  @override
  void initState() {
    super.initState();
    print(">>>Inside music player");
    _pageManager = PageManager(url: widget.songUrl);
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case "player":
                  break;
                case "home":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: "player",
                  child: Text("Go to Music player"),
                ),
                const PopupMenuItem(
                  value: "home",
                  child: Text("Go to home screen"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // const Spacer(),
            // Displaying the song's image
            Container(
              width: screenWidth * 0.3, // 80% of screen width
              height: screenHeight * 0.3, // 30% of screen height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.imageUrl,
                  fit:
                      BoxFit
                          .cover, // Ensures the image covers the available space
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const SizedBox(height: 20.0),
            ValueListenableBuilder<ProgressBarState>(
              valueListenable: _pageManager.progressNotifier,
              builder: (_, value, __) {
                return ProgressBar(
                  progress: value.current,
                  buffered: value.buffered,
                  total: value.total,
                  onSeek: _pageManager.seek,
                );
              },
            ),
            ValueListenableBuilder<ButtonState>(
              valueListenable: _pageManager.buttonNotifier,
              builder: (_, value, __) {
                switch (value) {
                  case ButtonState.loading:
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 32.0,
                      height: 32.0,
                      child: const CircularProgressIndicator(),
                    );
                  case ButtonState.paused:
                    return IconButton(
                      icon: const Icon(Icons.play_arrow),
                      iconSize: 32.0,
                      onPressed: () => _pageManager.play(),
                    );
                  case ButtonState.playing:
                    return IconButton(
                      icon: const Icon(Icons.pause),
                      iconSize: 32.0,
                      onPressed: () => _pageManager.pause(),
                    );
                  case ButtonState.completed:
                    return IconButton(
                      icon: const Icon(Icons.replay),
                      iconSize: 32.0,
                      onPressed: () => _pageManager.replay(),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
