import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_feed/data/categoriesList.dart'as categoriesList;

import 'NewsRoute.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => new _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      body: categoriesList.list == null
          ? const Center(child: const CircularProgressIndicator())
          : new GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 25.0),
        padding: const EdgeInsets.all(10.0),
        itemCount: categoriesList.list.length,
        itemBuilder: (BuildContext context, int index) {
          return new GridTile(
            footer: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Flexible(
                    child: new SizedBox(
                      height: 16.0,
                      width: 100.0,
                      child: new Text(
                        categoriesList.list[index]["name"],
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ]),
            child: new Container(
              height: 500.0,
              child: new GestureDetector(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: new Row(
                        children: <Widget>[
                          new Stack(
                            children: <Widget>[
                              new SizedBox(
                                child: new Container(
                                  child: new CircleAvatar(

                                    backgroundColor: Colors.white,
                                    radius: 40.0,
                                    child: new Icon(
                                        categoriesList.list[index]
                                        ["icon"],
                                        size: _iconAnimation.value * 30,
                                        color: categoriesList.list[index]
                                        ["color"]),
                                  ),
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (_) =>
                          new NewsRoute()
                      ));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}