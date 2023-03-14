import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final String? cardText;
  final String? title;
  final String? subTitle;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final bool? bigText;
  
  const ElevatedCard({
    super.key, 
    this.cardText,
    this.title,
    this.subTitle,
    this.onTap,
    this.height = 80,
    this.width = 160,
    this.bigText = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: title == null ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
              children: [
                if(title != null)
                  Text(
                    title ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    )),
                if(subTitle != null)
                  Text(
                    subTitle ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic
                    )),
                if(cardText != null)
                Center(
                  child: Text(
                    cardText??'',
                    textAlign: TextAlign.center,
                    style: bigText! ? const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'
                    ) : const TextStyle() ,
                  )
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
