import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/src/common_widgets/action_box.dart';
import 'package:voting_app/src/common_widgets/styles.dart';
import 'package:voting_app/src/features/info/presentation/info_screen.dart';

class ElectChainScreen extends StatefulWidget {
  @override
  _ElectChainScreenState createState() => _ElectChainScreenState();
}

class _ElectChainScreenState extends State<ElectChainScreen> {
  final GlobalKey _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      key: _scaffoldKey,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.indigo, Colors.blue],
            ),
          ),
        ),
        elevation: 0.0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'VOTE',
                style: TextStyle(
                  color: Colors.pink[300],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'SYSTEM',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.how_to_vote_rounded),
            onPressed: () {},
          ),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.info_outline_rounded),
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationVersion: '^1.0.0',
                  applicationName: 'ElectChain',
                );
              },
            ),
          ),
        ],
      ),
      body: HomeScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(InfoScreen()),
        child: Container(
          decoration: BoxStyles.gradientBox,
          child: IconButton(
            icon: Icon(Icons.how_to_vote_rounded),
            onPressed: () => print('How to vote'),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  TextEditingController _electionAccessCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ButtonStyle(
      fixedSize: MaterialStateProperty.all<Size>(
        Size.fromHeight(40.0),
      ),
    );
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "SEARCH ELECTIONS",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  height: 50.0,
                  margin: const EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: TextFormField(
                    controller: _electionAccessCodeController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      hintText: "SEARCH ELECTIONS",
                      hintStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0, left: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.indigo, Colors.blue],
                    ),
                  ),
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),
                      label: Text(
                        "FIND",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      style: buttonStyle),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/jobs');
                  },
                  child: ActionBox(
                    action: "Create Election",
                    description: "Create a new vote",
                    image: Icons.how_to_vote,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/jobs');
                  },
                  child: ActionBox(
                    action: "Poll",
                    description: "Create a new poll",
                    image: Icons.poll,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: ActionBox(
                    action: "My Elections",
                    description: "Create a new vote",
                    image: Icons.ballot,
                  ),
                ),
                ActionBox(
                  action: "FAQ",
                  description: "Create a new poll",
                  image: Icons.description,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
