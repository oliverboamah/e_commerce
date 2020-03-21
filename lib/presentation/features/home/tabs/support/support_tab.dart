// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/home/tabs/support/support_bloc.dart';
import 'package:e_commerce/presentation/features/home/tabs/support/support_state.dart';
import 'package:e_commerce/presentation/features/home/tabs/support/views/support_view.dart';

class SupportTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SupportTabState();
}

class _SupportTabState extends State<SupportTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<SupportBloc>(
        create: (BuildContext context) => SupportBloc(),
        child: SupportWrapper());
  }

  @override
  bool get wantKeepAlive => true;
}

class SupportWrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SupportWrapperState();
}

class _SupportWrapperState extends State<SupportWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportBloc, SupportState>(
      builder: (BuildContext context, SupportState state) {
        return BlocListener<SupportBloc, SupportState>(
            listener: (BuildContext context, SupportState state) {},
            child: SupportView());
      },
    );
  }
}
