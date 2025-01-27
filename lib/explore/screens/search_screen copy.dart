// import 'package:flutter/material.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
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
