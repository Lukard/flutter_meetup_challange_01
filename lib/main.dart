import 'package:flutter/material.dart';
import 'package:meetup_challange_01/theme.dart';
import 'package:meetup_challange_01/widgets.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: appTheme,
      home: new ProjectFundingScaffold(
        project: "CrowdFounder",
        projectImageUrl: "https://cmkt-image-prd.global.ssl.fastly.net/0.1.0/ps/1571726/1280/640/m1/fpnw/wm0/game_background_65-.jpg?1471607773&s=0ff18ff1ba29f749dfecf3bef75ab5ca",
        author: "Nathalie P.",
        avatarUrl: "https://estag.fimagenes.com/img/3/2/t/1/6/2t16_900.jpg",
        title: "Sustentability S/A: A mobile game about managing green business",
        description: "O estilo será em point-click, onde os personagens se movimentam com o click da tela",
        raisedAmount: "75,000",
        totalAmount: "100,000",
        backers: "300",
        daysToGo: "30",
      ),
    );
  }
}