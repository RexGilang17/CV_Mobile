import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("CURRICULUM VITAE"),
          backgroundColor: Colors.black,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.commentDots,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(),
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: Text(
                    "Saya seorang fresh graduate lulusan SMK Teknik Komputer Dan Jaringan dari SMKN 1 KAB.TANGERANG. Saya merupakan pribadi yang suka dengan bahasa pemrograman dan tertarik untuk berkarir di bidang pengembangan perangkat lunak atau aplikasi.  Berbekal latar belakang pendidikan dan kemampuan di bidang IT, saya siap menyumbangkan waktu dan kompetensi saya."),
              ),

              _buildTitle("Skills"),
              SizedBox(height: 10.0),
              _buildSkillRow("Java", 0.85),
              SizedBox(height: 5.0),
              _buildSkillRow("JavaScript", 0.75),
              SizedBox(height: 5.0),
              _buildSkillRow("HTML/CSS", 0.95),
              SizedBox(height: 5.0),
              _buildSkillRow("VUE JS", 0.75),
              SizedBox(height: 5.0),
              _buildSkillRow("Flutter", 0.75),
              SizedBox(height: 5.0),
              _buildTitle("Experience"),
              SizedBox(height: 10.0),
              _buildExperienceRow(
                  company: "Gajah Tunggal",
                  position: "FullStack Developer",
                  duration: "2022 - 2023"),
              _buildExperienceRow(
                  company: "Tokopedia",
                  position: "CEO Developer",
                  duration: "2024 - 2025"),
              _buildExperienceRow(
                  company: "Gojek",
                  position: "CEO Developer",
                  duration: "2026 - 2030"),
              _buildExperienceRow(
                  company: "Entreprenuer",
                  position: "CEO",
                  duration: "2019 - Saat ini"),
              _buildTitle("Education"),
              SizedBox(height: 5.0),
              _buildExperienceRow(
                  company: "SMKN 1 KAB.Tangerang",
                  position: "Teknik Komputer Jaringan",
                  duration: "2018 - 2021"),
              _buildExperienceRow(
                  company: "Bootcamp",
                  position: "Politeknik Gajah Tunggal",
                  duration: "2022 - Saat ini"),

              //Contact
              _buildTitle("Contact"),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  SizedBox(width: 30.0),
                  Icon(
                    Icons.mail,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "gilangramdhhan17@gmail.com",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 30.0,
                  ),
                  Icon(
                    Icons.phone,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "082299600287",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              _buildSosialsRow(),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSosialsRow() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 20.0,
        ),
        IconButton(
          color: Colors.red,
          icon: Icon(
            FontAwesomeIcons.instagram,
            size: 40.0,
          ),
          onPressed: () {
            _launchURL("https://www.instagram.com/");
          },
        ),
        SizedBox(
          width: 20.0,
        ),
        IconButton(
          color: Colors.black,
          icon: Icon(
            FontAwesomeIcons.github,
            size: 40.0,
          ),
          onPressed: () {
            _launchURL("https://github.com/rexgilang17");
          },
        ),
        SizedBox(
          width: 20.0,
        ),
        IconButton(
          color: Colors.blue,
          icon: Icon(
            FontAwesomeIcons.linkedin,
            size: 40.0,
          ),
          onPressed: () {
            _launchURL("https://youtube.com/");
          },
        ),
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ListTile _buildExperienceRow(
      {required String company, String? position, String? duration}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(
          FontAwesomeIcons.school,
          size: 20.0,
          color: Colors.black54,
        ),
      ),
      title: Text(
        company,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$position ($duration)"),
    );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
      children: <Widget>[
        SizedBox(width: 16.0),
        Expanded(
          flex: 2,
          child: Text(
            skill.toUpperCase(),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: level,
          ),
        ),
        SizedBox(width: 16.0),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black54,
          ),
        ],
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 20.0,
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(color: Colors.grey.shade200),
          width: 90.0,
          child: CircleAvatar(
            radius: 35.0,
            backgroundColor: Colors.transparent,
            foregroundImage: AssetImage("assets/images/gilang.JPG"),
          ),
        ),
        SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Gilang Romadhan",
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Full Stack Developer"),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.mapLocationDot,
                  size: 15.0,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Kabupaten Tangerang. Tigaraksa",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
