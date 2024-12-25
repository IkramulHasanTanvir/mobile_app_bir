import 'package:get/get.dart';

class NavController extends GetxController {
   int _selectedIndex = 0;

  int get  selectedIndex => _selectedIndex;

  void changePage(int index) {
    if(index == _selectedIndex){
      return;
    }
    _selectedIndex = index;
    update();
  }

  void backHome(){
    changePage(0);
  }

  void moveReport(){
    changePage(3);
  }
}
