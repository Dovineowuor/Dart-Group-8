import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Dashboard function 
// This function declares a dashboard
// This file only renders each widget only wheen the user is authenticated 

// Dashboard
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
// Check account authentication status
class _DashboardState extends State<Dashboard> {
  Future<String> getAccountStatus() async {
    var response = await http.get('http://example.com/account/status');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Authentication failed';
    }
  }
// Check account ballance only if authenticated
  Future<String> getBalance() async {
    var response = await http.get('http://example.com/account/balance');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Authentication failed';
    }
  }
//  Check and return full account statement only if authenticated to
  Future<String> getFullStatement() async {
    var response = await http.get('http://example.com/account/full-statement');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Authentication failed';
    }
  }
// Acquiring mini-statement only if authenticated
  Future<String> getMiniStatement() async {
    var response = await http.get('http://example.com/account/mini-statement');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Authentication failed';
    }
  }
// Display account transactions analytics only if authenticated
  Future<String> getAnalytics() async {
    var response = await http.get('http://example.com/account/analytics');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Authentication failed';
    }
  }
// Render dashboard properties
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: getAccountStatus(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            FutureBuilder(
              future: getBalance(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            FutureBuilder(
              future: getFullStatement(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            FutureBuilder(
              future: getMiniStatement(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            FutureBuilder(
              future: getAnalytics(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}