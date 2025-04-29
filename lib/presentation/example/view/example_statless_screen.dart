import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/layout/default_layout.dart';
/*
해당 statless 화면은 불변성 화면이다
내가 ui를 그리기만 하면될때 만들자

 */

class ExampleStatelessScreen extends ConsumerWidget {
  const ExampleStatelessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      showAppBar: true,
      showBack: true,
      title: '예제 서브 스크린',
      child: const Center(
        child: Text('하이'),
      ),
    );
  }
}
