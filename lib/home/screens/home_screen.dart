import 'package:flutter/material.dart';
import 'package:trugether_frontend/explore/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomeTab(), SearchScreen(), CreateRoomTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music),
            label: 'Create Room',
          ),
        ],
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// Home Tab
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Home", style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Albums",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  width: 100,
                  color: Colors.deepPurpleAccent,
                  child: Center(
                    child: Text(
                      "Album ${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Songs",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.music_note, color: Colors.deepPurple),
                title: Text(
                  "Song ${index + 1}",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Artist Name",
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Explore Tab
// class ExploreTab extends StatelessWidget {
//   const ExploreTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text("Explore", style: TextStyle(color: Colors.white)),
//         automaticallyImplyLeading: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: const TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   ),
//                   prefixIconColor: Colors.white,
//                   prefixIcon: Icon(Icons.search),
//                   hintText: "Music, Artists",
//                   hintStyle: TextStyle(color: Colors.white),
//                   contentPadding: EdgeInsets.symmetric(
//                     vertical: 8,
//                     horizontal: 20,
//                   ),
//                 ),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Top Searches",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 8),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                     "Search Item ${index + 1}",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Trending Songs",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: const Icon(
//                       Icons.trending_up,
//                       color: Colors.deepPurple,
//                     ),
//                     title: Text(
//                       "Trending Song ${index + 1}",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// New Room Tab
class CreateRoomTab extends StatelessWidget {
  const CreateRoomTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Start a Room",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                  child: const Text("New Room"),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.deepPurple),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                  child: const Text(
                    "Join with a Code",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            const Image(
              image: AssetImage(
                'assets/images/logo/newroom.png',
              ), // Add your image asset
              height: 250,
            ),
            const SizedBox(height: 16),
            const Text(
              "Get a link that you can share",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            const Text(
              "Tap New room to get a link that you can send to people that you want to listen songs with",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
