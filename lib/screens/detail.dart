import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/string_resources.dart';


class DetailScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => DetailScreenState();

}

class DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: _buildBodyWidget(context),
    );
  }

  Widget _buildAppBarWidget(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.DarkColor),
      elevation: 0.0,
      backgroundColor: AppColors.PrimaryColor,
      centerTitle: true,
      title: Text(
        String_dummy_text,
        style: TextStyle(color: AppColors.DarkColor),
      ),
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Container(
      width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/scoob.png"),
                fit: BoxFit.fill)),
      ),
          Container(
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Text(
              String_dummy_description,
              style: TextStyle(fontSize: 15.0, color: AppColors.LightBlack),
            ),
          )
        ],
      ),
    );
  }
}
