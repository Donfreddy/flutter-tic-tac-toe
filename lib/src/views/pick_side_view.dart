import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/service_locator.dart';
import 'package:tic_tac_toe/src/services/sound_service.dart';

class PickSideView extends StatefulWidget {
  const PickSideView({Key? key}) : super(key: key);

  static const routeName = '/pick_side_view';

  @override
  _PickSideViewState createState() => _PickSideViewState();
}

class _PickSideViewState extends State<PickSideView> {
  final soundService = locator<SoundService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                'Pic Your Side',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
