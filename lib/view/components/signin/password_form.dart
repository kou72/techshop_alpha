// 依存パッケージ
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 参照ファイル
import '../../../view_model/signin_view_model.dart';

class PasswordForm extends ConsumerWidget {
  const PasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final screenMaxWidth = MediaQuery.of(context).size.width;
    final vm = watch(signinViewModelProvider.notifier);

    return Container(
      margin: const EdgeInsets.all(8),
      width: screenMaxWidth * 0.7,
      child: TextFormField(
        initialValue: vm.state.password,
        onChanged: vm.changePassword,
        validator: (value) => vm.validatePassword() ? 'パスワードを入力してください' : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'パスワード',
        ),
      ),
    );
  }
}
