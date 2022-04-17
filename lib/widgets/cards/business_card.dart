import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wattio_frontend/helpers/screen_helper.dart';
import 'package:wattio_frontend/styles/colors.dart';

class BusinessCard extends StatefulWidget {
  const BusinessCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map<String, dynamic> data;

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  late Map<String, dynamic> data;
  List<String> personTypes = ['Pessoa Física', 'Pessoa Jurídica'];
  late double percentage;
  @override
  void initState() {
    super.initState();
    data = widget.data;
    percentage = double.tryParse((data['desconto'] * 100).toString()) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    ScreenHelper screen = ScreenHelper(context: context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(bottom: 30.0),
      width: screen.width * .02,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: AppColors.bluePrimary,
        boxShadow: [
          BoxShadow(
              blurStyle: BlurStyle.inner,
              color: Colors.black.withOpacity(0.7),
              blurRadius: 15.0,
              offset: const Offset(5, 5))
        ],
        border: Border.all(
          width: 1.0,
          color: AppColors.textPrimary,
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Material(
          shape: const CircleBorder(
            side: BorderSide(
              width: 5.0,
              color: AppColors.yellowPrimary,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(30.0),
            splashColor: Colors.green,
            onTap: () {},
            child: const CircleAvatar(
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        Expanded(
            child: Column(
          children: [
            Text(
              data['nome'].toString().toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                letterSpacing: 2.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List<Widget>.of(
                personTypes.map(
                  (e) => Row(
                    children: [
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 20.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        e.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Desconto: $percentage%',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            )
          ],
        ))
      ]),
    );
  }
}
