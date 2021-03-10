import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ActionCardType {
  clickable,
  switchOnOff,
}

class ActionCard {
  ActionCard({
    @required this.title,
    @required this.action,
    this.type = ActionCardType.clickable,
    this.switchValue = false,
  });

  final String title;
  final Function action;
  final ActionCardType type;
  final bool switchValue;
}

class TitleSubtitleSubListCard extends StatelessWidget {
  TitleSubtitleSubListCard({
    @required this.title,
    @required this.cards,
    this.subtitle,
    this.subtitleWidget,
  });

  final String title;
  final String subtitle;
  final Widget subtitleWidget;
  final List<ActionCard> cards;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
        final ActionCard card = cards[index];
        if (index == 0) {
          return Column(
            children: <Widget>[
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: Get.textTheme.headline3,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: getSubtitle(),
                ),
              ),
              _buildCard(card),
            ],
          );
        }
        return _buildCard(card);
      },
    );
  }

  Widget getSubtitle() {
    if (subtitleWidget != null) {
      return subtitleWidget;
    } else {
      return Text(
        subtitle,
        textAlign: TextAlign.start,
        style: Get.textTheme.subtitle2,
      );
    }
  }

  Widget _buildCard(ActionCard card) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: SizedBox(
        height: 60,
        child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            child: _conditionalRendering(card)),
      ),
    );
  }

  Widget _conditionalRendering(ActionCard card) {
    if (card.type == ActionCardType.switchOnOff)
      return _buildSwitchOnOffCard(card);
    return _buildClickableCard(card);
  }

  Widget _buildClickableCard(ActionCard card) {
    return InkWell(
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      onTap: card.action,
      splashColor: const Color(primaryColor).withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              card.title,
              style: Get.textTheme.headline3.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const Icon(
              Icons.chevron_right,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchOnOffCard(ActionCard card) {
    return InkWell(
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      onTap: card.action,
      splashColor: const Color(primaryColor).withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              card.title,
              style: Get.textTheme.headline3.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              (card.switchValue ? 'active' : 'inactive').tr,
              style: Get.textTheme.headline3.copyWith(
                  fontSize: 14,
                  color: Color(card.switchValue ? successColor : errorColor)),
            ),
          ],
        ),
      ),
    );
  }
}
