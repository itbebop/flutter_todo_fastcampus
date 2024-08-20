import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/constant_widget.dart';
import 'package:fast_app_base/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nav/dialog/dialog.dart';

class WriteTodoDialog extends DialogWidget {
  WriteTodoDialog({super.key});

  @override
  DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends DialogState<WriteTodoDialog> {
  final DateTime _selectedDate = DateTime.now();
  final textController = TextEditingController();
  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
      body: RoundedContainer(
        color: context.backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                '할일을 작성해 주세요.'.text.size(18).bold.make(),
                spacer,
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_month),
                )
              ],
            ),
            height20,
            Row(
              children: [
                const Expanded(child: TextField()),
                RoundButton(
                  text: '추가',
                  onTap: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
