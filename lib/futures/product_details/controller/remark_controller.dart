import 'package:get/get.dart';

class RemarkController extends GetxController {
  double _rating = 0.0;

  double get rating => _rating;

  String get ratingText => _ratingText;

  String _ratingText = "Add Your Remarks";

  void updateRatingText(double rating) {
    if (rating == 2) {
      _ratingText = "Bad";
    } else if (rating == 3) {
      _ratingText = "Oky";
    } else if (rating == 4) {
      _ratingText = "Good";
    } else if (rating == 5) {
      _ratingText = "Excellent";
    } else {
      _ratingText = "";
    }
    update();
  }
}
