import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/enum/response_state_enum.dart';
import '../../../core/layout/default_layout.dart';
import '../../../service/example/basic/viewModel/example_view_model.dart';

class ExampleScreen extends ConsumerStatefulWidget {
  const ExampleScreen({super.key});

  @override
  ConsumerState<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends ConsumerState<ExampleScreen> {
  late final StreamSubscription<NetworkResStatus> example_stream_sub;
  @override
  void initState() {
    super.initState();
    final viewModel = ref.read(exampleViewModelProvider.notifier);
    example_stream_sub = viewModel.exampleStream.listen((state) {
      switch (state) {
        case NetworkResStatus.loading:
          break;
        case NetworkResStatus.success:
          break;
        case NetworkResStatus.failure:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(exampleViewModelProvider);
    final vm = ref.read(exampleViewModelProvider.notifier);
    // TODO: 데이터가 필요한 스크린은 항상 선로딩, 후렌더의 형태를 취한다.
    // pseudo-code
    // if
    //    no data's loaded
    // then
    //    render Loading Indicator.

    // TODO: 스크린은 최대한 깔끔하게, 컴포넌트를 최대한 분리하며 작성한다.
    return const DefaultLayout(
      child: Center(
        child: SizedBox(),
      ),
    );
  }
}
