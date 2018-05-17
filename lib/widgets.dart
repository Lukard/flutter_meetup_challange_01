import 'package:flutter/material.dart';
import 'package:meetup_challange_01/theme.dart';

class ProjectFundingScaffold extends StatelessWidget {
  ProjectFundingScaffold({
    this.project,
    this.projectImageUrl,
    this.author,
    this.avatarUrl,
    this.title,
    this.description,
    this.raisedAmount,
    this.totalAmount,
    this.backers,
    this.daysToGo,
  });

  final String project;
  final String projectImageUrl;
  final String author;
  final String avatarUrl;
  final String title;
  final String description;
  final String raisedAmount;
  final String totalAmount;
  final String backers;
  final String daysToGo;

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new ProjectFundingAppBar(titleText: project),
        body: new ProjectFundingBody(
          projectImageUrl: projectImageUrl,
          author: author,
          avatarUrl: avatarUrl,
          title: title,
          description: description,
          raisedAmount: raisedAmount,
          totalAmount: totalAmount,
          backers: backers,
          daysToGo: daysToGo,
        ),
      );
}

class ProjectFundingAppBar extends AppBar {
  ProjectFundingAppBar({
    this.titleText,
  });

  final String titleText;

  @override
  Widget get title => new Text(titleText);

  @override
  Widget get leading => new IconButton(
        icon: new Icon(Icons.menu),
        onPressed: () {},
      );
}

class ProjectFundingBody extends StatelessWidget {
  const ProjectFundingBody({
    Key key,
    this.projectImageUrl,
    this.author,
    this.avatarUrl,
    this.title,
    this.description,
    this.raisedAmount,
    this.totalAmount,
    this.backers,
    this.daysToGo,
  });

  final String projectImageUrl;
  final String author;
  final String avatarUrl;
  final String title;
  final String description;
  final String raisedAmount;
  final String totalAmount;
  final String backers;
  final String daysToGo;

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new ProjectImageAuthorTag(
          projectImageUrl: projectImageUrl,
          name: author,
          avatarUrl: avatarUrl,
        ),
        new ProjectFundingContent(
          title: title,
          description: description,
          raisedAmount: raisedAmount,
          totalAmount: totalAmount,
          backers: backers,
          daysToGo: daysToGo,
        ),
      ],
    );
  }
}

class ProjectImageAuthorTag extends StatelessWidget {
  const ProjectImageAuthorTag({
    Key key,
    this.projectImageUrl,
    this.name,
    this.avatarUrl,
  }) : super(key: key);

  final String projectImageUrl;
  final String name;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: const Alignment(1.0, 1.0),
      children: <Widget>[
        new Padding(
          padding: new EdgeInsetsDirectional.only(bottom: 40.0),
          child: new Image.network(projectImageUrl),
        ),
        new ProfileAvatar(
          name: name,
          avatarUrl: avatarUrl,
        ),
      ],
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key key,
    this.name,
    this.avatarUrl,
  }) : super(key: key);

  final String name;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsetsDirectional.only(end: 30.0),
      child: Column(children: <Widget>[
        new Container(
          width: 70.0,
          height: 70.0,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new NetworkImage(avatarUrl),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
            border: new Border.all(
              color: Colors.white,
              width: 4.0,
            ),
          ),
        ),
        new Text(
          name,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}

class ProjectFundingContent extends StatelessWidget {
  const ProjectFundingContent({
    Key key,
    this.title,
    this.description,
    this.raisedAmount,
    this.totalAmount,
    this.backers,
    this.daysToGo,
  }) : super();

  final String title;
  final String description;
  final String raisedAmount;
  final String totalAmount;
  final String backers;
  final String daysToGo;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new ProjectFundingTitle(
            title: title,
          ),
          new ProjectFundingDescription(
            description: description,
          ),
          new ReadMoreButton(),
          new FundedProgressBar(progress: 0.6),
          new FundingInfo(
            raisedAmount: raisedAmount,
            totalAmount: totalAmount,
            backers: backers,
            daysToGo: daysToGo,
          ),
          new BackThisProjectButton(),
        ],
      ),
    );
  }
}

class ProjectFundingTitle extends StatelessWidget {
  const ProjectFundingTitle({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Text(
      title,
      textAlign: TextAlign.start,
      style: AppTextStyles.title,
    );
  }
}

class ProjectFundingDescription extends StatelessWidget {
  const ProjectFundingDescription({
    Key key,
    this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: new Text(
        description,
        style: AppTextStyles.description,
      ),
    );
  }
}

class ReadMoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: new InkWell(
            child: new Text(
              "READ MORE",
              style: AppTextStyles.readMore,
            ),
            onTap: () => {},
          ),
        ),
      ],
    );
  }
}

class FundedProgressBar extends StatelessWidget {
  const FundedProgressBar({
    Key key,
    this.progress,
  }) : super(key: key);

  final double progress;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: new LinearProgressIndicator(
        value: progress,
        backgroundColor: Colors.black12,
        valueColor: new AlwaysStoppedAnimation<Color>(appTheme.primaryColor),
      ),
    );
  }
}

class FundingInfo extends StatelessWidget {
  const FundingInfo({
    Key key,
    this.raisedAmount,
    this.totalAmount,
    this.backers,
    this.daysToGo,
  }) : super(key: key);

  final String raisedAmount;
  final String totalAmount;
  final String backers;
  final String daysToGo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        top: 8.0,
        right: 24.0,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _fact(
            "\$$raisedAmount",
            "of \$$totalAmount goal",
          ),
          _fact(
            backers,
            "backers",
          ),
          _fact(
            daysToGo,
            "days to go",
          ),
        ],
      ),
    );
  }

  Widget _fact(String relevant, String informative) {
    return new Column(
      children: <Widget>[
        new Text(
          relevant,
          style: AppTextStyles.fundingRelevant,
        ),
        new Text(
          informative,
          style: AppTextStyles.fundingInformative,
        ),
      ],
    );
  }
}

class BackThisProjectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 24.0),
      child: new RaisedButton(
        onPressed: () => {},
        color: appTheme.primaryColor,
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0),
        ),
        child: new Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new Text("BACK THIS PROJECT"),
            ),
          ],
        ),
      ),
    );
  }
}
