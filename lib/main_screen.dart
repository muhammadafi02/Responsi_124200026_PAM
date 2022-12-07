import 'package:flutter/material.dart';
import 'package:responsimobile/data_source.dart';
import 'package:responsimobile/matches_model.dart';
import 'detail_screen.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Piala Dunia 2022"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
            future: MatchesSource.instance.LoadMatches(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
              if (snapshot.hasError) {
                return _buildErrorSection();
              }
              if (snapshot.hasData) {
                return _buildSuccessSection(snapshot.data);
              }
              return _buildLoadingSection();
            }
        ),
      ),
    );

  }

  Widget _buildErrorSection(){
    return Text("Error");
  }
  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(List<dynamic> data){
    return ListView.builder(
      itemCount: 48,
      itemBuilder: (BuildContext context, int index){
        MatchesModel matchesModel = MatchesModel.fromJson(data[index]);
        return InkWell(
          onTap: (){

          },
          child: Container(
            height: 100,
            width: 200,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 150,
                      width: 80,
                          child: Image.network(
                              'https://countryflagsapi.com/png/${matchesModel!.homeTeam!.name!}'
                          )
                  ),
                  Text(("${matchesModel!.homeTeam!.name!}")),
                  Text(("${matchesModel!.homeTeam!.goals!}")),
                  Text('-'),
                  Text(("${matchesModel!.awayTeam!.goals!}")),
                  Text(("${matchesModel!.awayTeam!.name!}")),
                  Container(
                    height: 150,
                      width: 80,
                          child: Image.network('https://countryflagsapi.com/png/${matchesModel!.awayTeam!.name!}')
                  ),
                ],
              ),
            ),
          ),
        );
      },
      //
    );
  }
}