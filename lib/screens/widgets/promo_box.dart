import 'package:flutter/material.dart';
import 'package:kamelfoodapp/models/promo_model.dart';

class PromoBox extends StatelessWidget {
  final Promo promo;
  const PromoBox({Key? key, required this.promo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5.0),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.red,
            image: DecorationImage(
              image: NetworkImage(
                promo.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ClipPath(
          clipper: PromoCustomClipper(),
          child: Container(
              margin: const EdgeInsets.only(right: 5.0),
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.red,
                //  image: DecorationImage(
                //   image: NetworkImage(
                //     'https://images.unsplash.com/photo-1634046387041-db02e878d22b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80',
                //   ),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15, right: 125),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(promo.title),
                      SizedBox(
                        height: 15,
                      ),
                      Text(promo.description)
                    ]),
              )),
        ),
      ],
    );
  }
}

class PromoCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(255, size.height);
    path.lineTo(275, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
