import 'package:flutter/material.dart';

class EventLogoWidget extends StatelessWidget {
  const EventLogoWidget({
    super.key,
    required this.pageName,
  });

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4.5,
          child: Image.asset(
            'assets/images/riyadh-loreal.png',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          pageName,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.blue[700],
              ),
        ),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}
