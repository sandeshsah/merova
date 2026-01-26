import 'package:intl/intl.dart';

class DateFormatter {
  // Convert DateTime to 'yyyy-MM-dd' format
  static String formatDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  // Convert DateTime to 'hh:mm a' format
  static String formatTime(DateTime date) {
    final formatter = DateFormat('hh:mm a');
    return formatter.format(date);
  }

  // Convert DateTime to full datetime string
  static String formatDateTime(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(date);
  }

  // Return relative time like '2 hours ago'
  static String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) return 'just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes} min ago';
    if (difference.inHours < 24) return '${difference.inHours} hours ago';
    if (difference.inDays < 7) return '${difference.inDays} days ago';

    return DateFormat('MMM dd, yyyy').format(date);
  }
}
