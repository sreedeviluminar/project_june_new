import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Refractoring3(),));
}
class Refractoring3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Refactoring 3"),
      ),
      body: GridView.builder(
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context,index){
            return MyRefractoringWidget(
              rimage: Image.asset("assets/images/mango.png"),);
          }),
    );
  }
}
class MyRefractoringWidget extends StatelessWidget {
  final Color? bgcolor;
  final Image? rimage;
  VoidCallback? onClick;
  Widget? label;
  Widget? ricon;

  MyRefractoringWidget({
    this.bgcolor,
    required this.rimage,
    this.label,
    this.onClick,
    this.ricon
});
  @override
  Widget build(BuildContext context) {
    return Card(
     color:  bgcolor,
      child: ListTile(
        title: label,
        leading: rimage,
        onTap: onClick,
        trailing: ricon,
      ),
    );
  }

}
