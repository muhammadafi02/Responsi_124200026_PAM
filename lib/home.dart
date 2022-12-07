// import 'package:flutter/material.dart';
// import 'package:responsimobile/base_network.dart';
// import 'package:responsimobile/matches_model.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text("Piala Dunia 2022"),
//             backgroundColor: Colors.blue,
//           ),
//           body: Container(
//             padding: EdgeInsets.all(8),
//             child: FutureBuilder(
//               future: BaseNetwork.get("matches"),
//               builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                 if (snapshot.hasError) {
//                   return _buildErrorSection();
//                 }
//                 if (snapshot.hasData) {
//                   MatchesModel matchesModel = MatchesModel.fromJson(snapshot.data);
//                   return _buildSuccessSection(matchesModel);
//                 }
//                 return _buildLoadingSection();
//               },
//             ),
//           ),
//         )
//     );
//   }
//
//   Widget _buildErrorSection() {
//     return Text("Error");
//   }
//
//   Widget _buildLoadingSection() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
//
//   Widget _buildSuccessSection(MatchesModel data) {
//     return ListView.builder(
//         itemCount: 48,
//         itemBuilder: (BuildContext context, int index) {
//           return InkWell(
//               onTap: () {
//               },
//               child: Text(data.homeTeam!.name!)
//           );
//         }
//     );
//   }
// }