import 'package:boilerplate/ui/general_profile/widget/image_dialog.dart';
import 'package:flutter/material.dart';

class CertificatesInfo extends StatelessWidget {
  const CertificatesInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "CERTIFICATES",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                child: Image.network(
                  "https://hcti.io/v1/image/5023ad9f-20b8-4089-9e5e-d107d20e3a67",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.fill,
                ),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (_) => ImageDialog(
                      imageUrl:
                          "https://hcti.io/v1/image/5023ad9f-20b8-4089-9e5e-d107d20e3a67",
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                child: Image.network(
                  "https://hcti.io/v1/image/5023ad9f-20b8-4089-9e5e-d107d20e3a67",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.fill,
                ),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (_) => ImageDialog(
                      imageUrl:
                          "https://hcti.io/v1/image/5023ad9f-20b8-4089-9e5e-d107d20e3a67",
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
