import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final String cardText;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  
  const ElevatedCard({
    super.key, 
    required this.cardText,
    required this.onTap,
    this.height = 80,
    this.width = 160,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: SizedBox(
            width: width,
            height: height,
            child: Center(
              child: Center(
                child: Text(cardText),
              )
            ),
          ),
        ),
      ),
    );
  }
}
