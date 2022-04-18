import 'package:flutter/material.dart';
import 'package:wattio_frontend/styles/colors.dart';

class HireCard extends StatelessWidget {
  const HireCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.yellowPrimary,
      titlePadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
      title: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2.0,
              color: AppColors.bluePrimary,
            ),
          ),
        ),
        child: Text(
          'Parabéns!'.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32.0,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.local_post_office,
              color: AppColors.bluePrimary,
              size: 50.0,
            ),
            const SizedBox(
              width: 50.0,
            ),
            Expanded(
              child: Text(
                'Você contratou os serviços da ${data['nome']}'.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
    );
  }
}
