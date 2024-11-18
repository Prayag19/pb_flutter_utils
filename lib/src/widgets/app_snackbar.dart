import 'package:flutter/material.dart';
import '../network/base_error_handler.dart';

class AppSnackBarConfig {
  final Duration duration;
  final SnackBarBehavior snackBarBehavior;
  final Color? backgroundColor;
  final TextStyle? titleTextStyle;
  final TextStyle? messageTextStyle;
  final double? elevation;
  final Map<AppBaseStatus, IconData>? icons;
  final Map<AppBaseStatus, Color>? iconColors;

  AppSnackBarConfig({
    this.duration = const Duration(seconds: 2),
    this.snackBarBehavior = SnackBarBehavior.floating,
    this.backgroundColor,
    this.titleTextStyle,
    this.messageTextStyle,
    this.elevation,
    this.icons,
    this.iconColors,
  });
}

/// Singleton class for managing snack bars
class AppSnackBar {
  AppSnackBar._privateConstructor();
  static final AppSnackBar instance = AppSnackBar._privateConstructor();

  late AppSnackBarConfig _config;

  /// Initialize the snackbar with configuration
  void initialize(AppSnackBarConfig config) {
    _config = config;
  }

  /// Show snackbar based on BaseResponseHandler
  void showSnackBar(BuildContext context, BaseResponseHandler response) {
    IconData? icon = _config.icons?[response.status];
    Color? iconColor = _config.iconColors?[response.status];

    _showSnackBar(
      context,
      response.title ?? _defaultTitle(response.status!),
      response.message ?? _defaultMessage(response.status!),
      icon,
      iconColor,
    );
  }

  /// Default title fallback based on status
  String _defaultTitle(AppBaseStatus status) {
    switch (status) {
      case AppBaseStatus.success:
        return "Success";
      case AppBaseStatus.error:
        return "Error";
      case AppBaseStatus.loading:
        return "Loading";
      default:
        return "Notice";
    }
  }

  /// Default message fallback based on status
  String _defaultMessage(AppBaseStatus status) {
    switch (status) {
      case AppBaseStatus.success:
        return "Operation completed successfully!";
      case AppBaseStatus.error:
        return "An error occurred. Please try again.";
      case AppBaseStatus.loading:
        return "Please wait...";
      default:
        return "";
    }
  }

  /// Generic method to display a snack bar
  void _showSnackBar(
      BuildContext context,
      String title,
      String message,
      IconData? icon,
      Color? iconColor,
      ) {
    final snackBar = SnackBar(
      behavior: _config.snackBarBehavior,
      duration: _config.duration,
      backgroundColor: _config.backgroundColor ?? Theme.of(context).snackBarTheme.backgroundColor,
      elevation: _config.elevation,
      content: Row(
        children: [
          if (icon != null)
            Icon(icon, color: iconColor ?? Theme.of(context).iconTheme.color),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: _config.titleTextStyle ??
                      Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  message,
                  style: _config.messageTextStyle ?? Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
