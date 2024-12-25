import 'package:flutter/material.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';
import 'package:mobile_app_bir/common/widgets/card_image.dart';

class SearchItems extends StatelessWidget {
  const SearchItems({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.stock,
    required this.onTap,
  });

  final String image, title, description, stock;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: SizedBox(
            height: 65,
              width: 65,
              child: CardImage(image: image)),
          title: Text(
            title,
            style:  TextStyle(fontWeight: FontWeight.bold,fontSize: size.height * 0.016),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description,
                style:  TextStyle(fontSize: size.height * 0.016),

              ),
              SizedBox(height: size.height * 0.005),
              Row(
                children: [
                   Text(
                    'Stock: ',
                    style: TextStyle(color: Colors.grey,
                      fontSize: size.height * 0.016
                    ),
                  ),
                  Text(
                    stock,
                    style: TextStyle(
                      color: stock == 'Available' ? successColor : primaryColor,
                      fontSize: size.height * 0.016
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: Icon(
              Icons.arrow_forward_ios,
              size: size.height * 0.016,
            ),
        ),
        Divider(
          color: Colors.grey[100],
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
