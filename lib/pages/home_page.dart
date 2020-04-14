import 'package:covid19_app/components/country_item.dart';
import 'package:covid19_app/model/country.dart';
import 'package:covid19_app/pages/countrylist_page.dart';
import 'package:covid19_app/pages/world_page.dart';
import 'package:covid19_app/providers/covid_provider.dart';
import 'package:covid19_app/services/service.dart';
import 'package:covid19_app/util/responsive.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int tabIndex = 0;
  Responsive responsive;
  ThemeData theme;

  CovidProvider covidProvider;

  @override
  Widget build(BuildContext context) {
    covidProvider = Provider.of<CovidProvider>(context);
    responsive = Responsive(context);
    theme = Theme.of(context);
    return Scaffold(
      body: covidProvider.summary != null
          ? tabView()
          : Center(
              child: Text(
                "Cargando",
              ),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    ServiceGeneral().getSummary();

    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {
        tabIndex = _tabController.index;
      });
    });
  }

  Widget tabView() {
    return Scaffold(
      backgroundColor: Color(0xff1b191a),
      body: Stack(
        alignment: Alignment(0, 1),
        children: <Widget>[
          TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: responsive.ip(8)),
                  child: CountryListPage()),
              Padding(
                  padding: EdgeInsets.only(bottom: responsive.ip(8)),
                  child: WorldPage()),
            ],
          ),
          Container(
              height: responsive.ip(8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TabBar(
                    controller: _tabController,
                    onTap: (value) {

                      print(tabIndex);
                      setState(() {
                        tabIndex = value;
                      });
                    },
                    tabs: <Widget>[
                      Container(
                          width: responsive.ip(6),
                          height: responsive.ip(6),
                          child: Tab(
                              icon: Icon(
                            Icons.explore,
                            color: tabIndex == 0
                                ? theme.primaryColor
                                : Colors.grey,
                          ))),
                      Container(
                          width: responsive.ip(6),
                          height: responsive.ip(6),
                          child: Tab(
                              icon: Icon(
                            Icons.explore,
                            color: tabIndex == 1
                                ? theme.primaryColor
                                : Colors.grey,
                          ))),
                    ],
                    indicatorColor: Colors.transparent,
                    indicatorWeight: 4.0,
                    labelPadding: EdgeInsets.only(
                      top: 4,
                      bottom: 4,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }


}
