import 'package:flutter/material.dart';
import 'package:mother_and_me/components/loginRegisterLayout.dart';
import 'package:mother_and_me/components/constants.dart';
import 'package:mother_and_me/screens/babyProgressPage.dart';
import 'package:mother_and_me/screens/userProfile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginRegisterLayout(
        redirectingPage: HomePageDetails(),
        leadingTop: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
          },
          icon: Icon(
            Icons.person
          ),
        )
    );
  }
}

class HomePageDetails extends StatefulWidget {
  const HomePageDetails({Key? key}) : super(key: key);

  @override
  State<HomePageDetails> createState() => _HomePageDetailsState();
}

class _HomePageDetailsState extends State<HomePageDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 150,
          width: MediaQuery.of(context).size.width - 100,
          child: ListView.builder(
            itemCount: babyProgressImageLink.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: WeekItem(index: index,),
                );
              }
          ),
        ),
      ),
    );
  }
}

class WeekItem extends StatefulWidget {
  const WeekItem({Key? key, required this.index}) : super(key: key);

  final index;

  @override
  State<WeekItem> createState() => _WeekItemState();
}

class _WeekItemState extends State<WeekItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 20),
      width: 300,
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Week ${widget.index+1} Progress"),
          Container(
            margin: const EdgeInsets.only(left: 200),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BabyProgress(imageLink: babyProgressImageLink[widget.index], imageText: babyProgressText[widget.index],)));
                },
                icon: Icon(
                  Icons.arrow_forward
                )
            ),
          )
        ],
      ),
    );
  }
}
