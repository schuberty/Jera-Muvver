import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jera_muvver/src/shared/app/app_constants.dart';

class PassengerSliverAppBarWidget extends StatelessWidget {
  final VoidCallback? onLeadingPreassed;
  final IconData? leadingIcon;
  final String? titleText;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const PassengerSliverAppBarWidget({
    this.onLeadingPreassed,
    this.leadingIcon,
    this.titleText,
    this.actions,
    this.bottom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late final Widget? leadingIconWidget;
    late final Widget? titleWidget;

    if (leadingIcon != null) {
      leadingIconWidget = Icon(
        leadingIcon,
        color: Colors.white,
      );
    } else {
      leadingIconWidget = const Icon(
        Icons.arrow_back,
        color: Colors.white,
      );
    }

    if (titleText != null) {
      titleWidget = Text(
        titleText!,
        style: TextStyle(
          color: Colors.white.withOpacity(0.54),
          fontSize: 16,
        ),
      );
    } else {
      titleWidget = null;
    }

    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      forceElevated: true,
      shadowColor: Colors.black,
      backgroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      leading: IconButton(
        onPressed: onLeadingPreassed,
        icon: leadingIconWidget,
      ),
      title: titleWidget,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Container(
          decoration: BoxDecoration(
            gradient: AppConstants.linearDarkGradient(),
          ),
        ),
      ),
      actions: actions,
      bottom: bottom,
    );
  }
}
