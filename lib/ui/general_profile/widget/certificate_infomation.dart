import 'package:boilerplate/ui/general_profile/widget/image_dialog.dart';
import 'package:flutter/material.dart';

class CertificatesInfo extends StatelessWidget {
  final List<String> certificates;

  const CertificatesInfo({Key? key, required this.certificates})
      : super(key: key);

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
          Column(
            children: certificates
                .map(
                  (certificate) =>
                      CertificateItem(certificateImage: certificate),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

class CertificateItem extends StatelessWidget {
  final String certificateImage;
  const CertificateItem({Key? key, required this.certificateImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          child: Image.network(
            certificateImage,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.5,
            fit: BoxFit.fill,
          ),
          onTap: () async {
            await showDialog(
              context: context,
              builder: (_) => ImageDialog(
                imageUrl: certificateImage,
              ),
            );
          },
        ),
      ),
    );
  }
}
