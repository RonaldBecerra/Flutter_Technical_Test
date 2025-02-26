import 'package:flutter/material.dart';

class GenericCard extends StatelessWidget {
  final int kind; // 0 for a movie type card; 1 for an actor type card
  final String imgSrc;
  final String text1;
  final String text2;
  final VoidCallback onTap;

  const GenericCard({
    required this.kind,
    required this.imgSrc,
    required this.text1,
    required this.text2,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double containerRadius = 12.5;
    double fontSize1;
    double fontSize2;
    double paddingLeft;
    double paddingRight;
    double paddingTop;
    double paddingBottom;

    if (kind == 0){
      fontSize1 = 14;
      fontSize2 = 9;
      paddingLeft = 12;
      paddingRight = 12;
      paddingTop = 21;
      paddingBottom = 10;
    } else {
      fontSize1 = 10;
      fontSize2 = 8.5;
      paddingLeft = 12;
      paddingRight = 12;
      paddingTop = 6;
      paddingBottom = 10;
    }
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(containerRadius),
            child: Image.network(
              imgSrc,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: paddingLeft,
                right: paddingRight,
                bottom: paddingBottom,
                top: paddingTop,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(containerRadius),
                  bottomRight: Radius.circular(containerRadius),
                ),
                color: Colors.black.withOpacity(0.1),
              ),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: text1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize1,
                      ),
                    ),
                    TextSpan(
                      text: '\n$text2',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: fontSize2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}