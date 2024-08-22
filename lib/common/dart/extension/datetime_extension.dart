import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate => DateFormat('yyyy년 MM월 dd일').format(this);

  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDateTime => DateFormat('dd/MM/yyyy HH:mm').format(this);

  String get relativeDays {
    final diffDays = difference(DateTime.now().onlyDate).inDays; // 남은 날짜(차이가 양수)
    final isNegative = diffDays.isNegative; // 지나간 날짜(차이가 음수)

    final checkCondition = (diffDays, isNegative);
    return switch (checkCondition) {
      (0, _) => _tillToday, // 차이가 0 (오늘) // _의 뜻은 'isNegative값과 상관없이 diffDays의 조건만 만족한다면'
      (1, _) => _tillTomorrow,
      (_, true) => _dayPassed, // 음수기만 하면
      _ => _dayLeft, // default. 즉, 위의 경우가 다 아니라면
    };
  }

  // 날짜만 받아옴(시간빼고)
  DateTime get onlyDate {
    return DateTime(year, month, day);
  }

  String get _dayLeft => 'daysLeft'.tr(namedArgs: {"daysCount": difference(DateTime.now().onlyDate).inDays.toString()});

  String get _dayPassed => 'daysPassed'.tr(namedArgs: {"daysCount": difference(DateTime.now().onlyDate).inDays.abs().toString()});

  String get _tillToday => 'tillToday'.tr();

  String get _tillTomorrow => 'tillTomorrow'.tr();
}
