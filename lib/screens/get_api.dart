import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class getAPI extends StatefulWidget {
  @override
  _getAPIState createState() => _getAPIState();
}

class _getAPIState extends State<getAPI> {
  var users;
  bool isLoading = true;

  Future<Null> getUsers() async {
    // final response = await http.get('https://randomuser.me/api/?results=10');
    final response = await http.get('http://172.28.254.104/dods/services/public/api/ccaattmm/listCC');
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      isLoading = false;
      setState(() {
        users = jsonResponse['data'];
      });
    } else {
      print('CONNECTION ERROR');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('User List')),
      body: Card(
        child: RefreshIndicator(
          onRefresh: getUsers,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, int Index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          // leading: CircleAvatar(backgroundImage: NetworkImage(users[Index]['IMG_PATH'])),
                          onTap: () {},
                          title: Text('${users[Index]['cc_desc']}'),//Text('${users[Index]['name']['first']} ${users[Index]['name']['first']}'),
                          // subtitle: Text('${users[Index]['DETAIL']}'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                        Divider()
                      ],
                    );
                  },
                  itemCount: users != null ? users.length : 0,
                ),
        ),
      ),
    );
  }
}
