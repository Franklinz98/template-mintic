import 'package:flutter/material.dart';
import 'package:red_egresados/presentation/theme/colors.dart';

class MessageBubble extends StatelessWidget {
  final bool remote;
  final String message;
  final VoidCallback onHold;

  // ChatCard constructor
  MessageBubble(
      {Key? key,
      required this.message,
      required this.remote,
      required this.onHold})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    const _radious = Radius.circular(12);
    const _corner = Radius.circular(4);
    final _textTheme = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 14.0, fontWeight: FontWeight.w500);

    return Row(
      mainAxisAlignment:
          remote ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300, minWidth: 25),
          child: Card(
            elevation: 0,
            color: remote
                ? Theme.of(context).cardTheme.color
                : AppColors.mountainMeadow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: _radious,
                  topRight: _radious,
                  bottomLeft: remote ? _corner : _radious,
                  bottomRight: remote ? _radious : _corner),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                message,
                textAlign: remote ? TextAlign.start : TextAlign.end,
                style: remote
                    ? _textTheme
                    : _textTheme.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
