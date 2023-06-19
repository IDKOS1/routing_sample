import 'package:flutter/material.dart';
import 'package:navigater_practice/layout/main_layout.dart';
import 'package:navigater_practice/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() async{
        // true - pop 가능
        // false - pop 불가능
        // 어플리케이션을 핸드폰 뒤로가기 버튼으로 종료 막기
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: MainLayout(
          title: 'Home Screen',
          children: [
            ElevatedButton(
                onPressed: (){
                  // canPop: 뒤로갈 수 있으면 1, 없으면 0 리턴
                  print(Navigator.of(context).canPop());
                },
                child: Text('Can Pop')
            ),
            ElevatedButton(
                onPressed: (){
                  // maybePop: 뒤로갈 스크린이 없을때 pop이 안됨
                  Navigator.of(context).maybePop();
                },
                child: Text('Maybe Pop')
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('Pop')
            ),
            ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => RouteOneScreen(
                          number: 123,
                        ),
                    ),
                  );
                  
                  print(result);
                },
                child: Text('Push'),
            ),
          ],
      ),
    );
  }
}
