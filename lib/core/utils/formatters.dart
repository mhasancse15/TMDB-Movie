import 'package:intl/intl.dart';

abstract class AppFormatters {
  static String formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return 'N/A';
    try {
      final dateTime = DateTime.parse(dateStr);
      return DateFormat.yMMMd().format(dateTime);
    } catch (_) {
      return dateStr;
    }
  }

  static String formatYear(String? dateStr) {
    if (dateStr == null || dateStr.length < 4) return 'N/A';
    return dateStr.substring(0, 4);
  }

  static String formatRuntime(int? minutes) {
    if (minutes == null || minutes <= 0) return 'N/A';
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (hours > 0) {
      return '${hours}h ${mins}m';
    }
    return '${mins}m';
  }

  static String formatCurrency(int? amount) {
    if (amount == null || amount <= 0) return 'N/A';
    final formatter = NumberFormat.compactCurrency(symbol: '\$');
    return formatter.format(amount);
  }

  static String formatRating(double? rating) {
    if (rating == null || rating == 0) return 'NR';
    return rating.toStringAsFixed(1);
  }
}
