import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_info.dart';
import 'package:news_app/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Welcome>? _welcome;

  @override
  void initState() {
    var response = Api_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: FutureBuilder<Welcome>(
              future: _welcome,
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data?.data.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data?.data[index];
                      return Container(
                        height: 100,
                        color: Colors.lightBlueAccent,
                        child: Expanded(
                          child: Column(
                            children: [
                              Container(

                                height: 50.0, color: Colors.lightBlueAccent,
                                child: Text('hello' ),),
                              Container(
                                height: 50.0, color: Colors.lightBlueAccent,),
                            ],
                          ),
                        ),
                      );
                    });
              }
          ),
        ));
  }
}

 /* @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Future<Welcome>>('_welcome', _welcome));
    properties.add(DiagnosticsProperty<Future<Welcome>>('_welcome', _welcome));
  }
}
*/