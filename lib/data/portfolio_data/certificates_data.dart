import '../models/certificate_model.dart';

abstract final class CertificatesData {
  static const certificates = [
    CertificateModel(
      title: 'Mobile App Development Using Flutter',
      issuer: 'OUSOS Training & Human Resource Development',
      period: '21 Aug 2024 — 25 Sep 2024',
      duration: '30 Hours',
      image:
          'assets/images/certificates/flutter_level_1.webp',
    ),
    CertificateModel(
      title: 'Flutter Level (2)',
      issuer: 'OUSOS Training & Human Resource Development',
      period: '5 Oct 2024 — 21 Nov 2024',
      duration: '36 Hours',
      image:
          'assets/images/certificates/flutter_level_2.webp',
    ),
  ];
}
