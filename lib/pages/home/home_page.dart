import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/api/home_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// 使用AutomaticKeepAliveClientMixin实现页面状态缓存，并重写wantKeepAlive方法，让状态不被回收掉。
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void _incrementCounter() {
    setState(() {
      HomeApi.getHomeInfo().then((response) {
        print(response);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.reorder),
            onPressed: () {},
            color: Colors.green,
          ),
          title: ElevatedButton.icon(
            icon: const Icon(
              Icons.search,
              size: 16.0,
            ),
            label: const Text('点击搜索更多'),
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.grey,
              primary: Colors.grey.shade100,
              textStyle: const TextStyle(
                fontSize: 12.0,
              ),
              minimumSize: const Size(240.0, 40.0),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ).copyWith(
              elevation: ButtonStyleButton.allOrNull(0.0),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/search',
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.email),
              onPressed: () {},
              color: Colors.green,
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: '动态',
                  ),
                  Tab(
                    text: '推荐',
                  ),
                ],
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          toolbarHeight: 50.0,
        ),
        body: TabBarView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text("动态"),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const CircleAvatar(
                              backgroundImage: AssetImage('images/avatar.png'),
                              radius: 15.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: const Text('丧心病狂攒钱小组'),
                            ),
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Expanded(
                              child: Text(
                                  '你会给爸妈生活费吗你会给爸妈生活费吗你会给爸妈生活费吗你会给爸妈生活费吗你会给爸妈生活费吗你会给爸妈生活费吗你会给爸妈生活费吗你会给爸妈生活费吗你会给爸妈生活费吗你会给爸妈生活费吗你会给爸妈生活费吗你会给爸妈生活费吗你会给爸妈生活费吗'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
