import 'package:flutter/material.dart';
import 'package:navigater_practice/layout/main_layout.dart';
import 'package:navigater_practice/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'arguments: ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Pop')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/three', arguments: 999);
            },
            child: Text('Push Named')),
        ElevatedButton(
            onPressed: () {
              // pushReplacement: pop 시 Route One 로 이동(route two 를 route three로 대체)
              // pushAndRemoveUntil: false 루트 제거, true 루트 살림
              Navigator.of(context).pushReplacementNamed('/three');
            },
            child: Text('Push')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/three',
                (route) => route.settings.name == '/', // 홈스크린 전까지 루트 지움
              );
            },
            child: Text('Push And Remove Until'))
      ],
    );
  }
}
