import 'package:coronavirus_app/converters/news-search-response.dart';
import 'package:coronavirus_app/services/news.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StateNews extends StatefulWidget {
  const StateNews({Key key, this.name}) : super(key: key);

  final String name;

  @override
  StateNewsState createState() => StateNewsState();
}

class StateNewsState extends State<StateNews> {
  @override
  Widget build(BuildContext context) {
    final getNews = News().getLatest(stateName: widget.name);
    return Container(
        margin: EdgeInsets.only(left: 0, right: 0),
        child: FutureBuilder<List<Article>>(
            future: getNews,
            builder:
                (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              } else {
                var tiles = <Widget>[];
                for (final item in snapshot.data) {
                  tiles.add(Card(
                      elevation: 5,
                      child: InkWell(
                          onTap: () {
                            launch(item.url);
                          },
                          child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Row(children: [
                                Container(
                                    height: 80,
                                    width: 100,
                                    child: Image.network(item.urlToImage)),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(item.title,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              maxLines: 1),
                                          Text(item.description,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              maxLines: 2)
                                        ]),
                                  ),
                                )
                              ])))));
                }
                tiles.add(Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('News provided by newsapi.org')));
                return Column(children: tiles);
              }
            }));
  }
}
