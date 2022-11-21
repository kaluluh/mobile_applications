import 'package:flutter/material.dart';
import 'package:geoquiz/common/keys.dart';
import 'package:geoquiz/services/auth.dart';
import 'package:provider/provider.dart';

import '../common/navigation.dart';
import '../common/page_wrapper.dart';

class DashboardPage extends StatelessWidget with Keys {
  const DashboardPage({Key? key}) : super(key: key);

  Future<void> _signOut(AuthBase auth) async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return PageWrapper(
      backgroundImage: const AssetImage("assets/images/background_image.png"),
      bottomNav: createBottomNavigation(),
      child: _buildContent(auth),
    );
  }

  Widget _buildContent(AuthBase auth) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100.0,
            width: double.infinity,
            child: Card(
              color: Colors.white54,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Name here"),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            height: 200.0,
            width: double.infinity,
            child: const Card(
              color: Colors.white54,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("data"),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => {},
                label: Text(
                  "QuickPlay",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18.0,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(30, 197, 187, 1),
                  minimumSize: const Size(30.0, 80.0),
                ),
              ),
              SizedBox(width: 50.0),
              ElevatedButton.icon(
                onPressed: () => _signOut(auth),
                label: Text(
                  "Sign out",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                icon: Icon(
                  Icons.logout,
                  size: 20.0,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(30, 197, 187, 1),
                  minimumSize: const Size(30.0, 80.0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            height: 150.0,
            width: double.infinity,
            child: Card(
              color: Colors.white54,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Friends"),
                        SizedBox(
                          width: 20.0,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton.icon(
                            onPressed: () => {},
                            label: const Text(
                              "add Friends",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            icon: Icon(
                              Icons.add,
                              size: 16.0,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(30, 197, 187, 1),
                              minimumSize: const Size(10.0, 10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Name"),
                    Divider(
                      color: Colors.black,
                    ),
                    Text("Name"),
                    Divider(
                      color: Colors.black,
                    ),


                  ],
                ),
              ),
            ),
          ),
         ],
      ),
    );
  }
}
