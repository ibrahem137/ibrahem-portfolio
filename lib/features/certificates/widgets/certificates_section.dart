import 'package:flutter/material.dart';
import 'package:ibrahem_portfolio/core/widgets/hover_card.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_section.dart';
import '../../../core/widgets/responsive_container.dart';
import '../../../data/models/certificate_model.dart';
import '../../../data/portfolio_data/certificates_data.dart';
import '../../../l10n/app_localizations.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppSection(
      child: ResponsiveContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.certificatesEyebrow,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.4,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              l10n.certificatesTitle,
              style: context.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Text(
                l10n.certificatesDescription,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.onSurface.withValues(alpha: 0.68),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),

            // Certificates responsive layout
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 750;

                if (isMobile) {
                  return Column(
                    children: [
                      for (
                        var i = 0;
                        i < CertificatesData.certificates.length;
                        i++
                      ) ...[
                        _CertificateCard(
                          certificate: CertificatesData.certificates[i],
                          viewLabel: l10n.certificateView,
                        ),
                        if (i != CertificatesData.certificates.length - 1)
                          const SizedBox(height: AppSpacing.lg),
                      ],
                    ],
                  );
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: CertificatesData.certificates.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppSpacing.lg,
                    mainAxisSpacing: AppSpacing.lg,
                    mainAxisExtent: 620,
                  ),
                  itemBuilder: (context, index) {
                    return _CertificateCard(
                      certificate: CertificatesData.certificates[index],
                      viewLabel: l10n.certificateView,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CertificateCard extends StatelessWidget {
  final CertificateModel certificate;
  final String viewLabel;

  const _CertificateCard({required this.certificate, required this.viewLabel});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      borderRadius: BorderRadius.circular(AppRadius.xLarge),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.xLarge),
          border: Border.all(color: context.theme.dividerColor),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CertificateImage(certificate: certificate),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    certificate.title,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    certificate.issuer,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _MetaRow(
                    icon: Icons.calendar_month_outlined,
                    value: certificate.period,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _MetaRow(
                    icon: Icons.schedule_rounded,
                    value: certificate.duration,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  OutlinedButton.icon(
                    onPressed: () {
                      _showCertificate(context, certificate.image);
                    },
                    icon: const Icon(Icons.open_in_full_rounded),
                    label: Text(viewLabel),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCertificate(BuildContext context, String imagePath) {
    showDialog<void>(
      context: context,
      barrierColor: context.colors.scrim.withValues(alpha: 0.88),
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(AppSpacing.lg),
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  minScale: 0.7,
                  maxScale: 5,
                  child: Image.asset(imagePath, fit: BoxFit.contain),
                ),
              ),
              PositionedDirectional(
                top: 0,
                end: 0,
                child: IconButton.filled(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CertificateImage extends StatelessWidget {
  final CertificateModel certificate;

  const _CertificateImage({required this.certificate});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.primary.withValues(alpha: 0.04),
      child: InkWell(
        onTap: () {
          _showCertificateImage(context);
        },
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: Image.asset(
            certificate.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _showCertificateImage(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierColor: context.colors.scrim.withValues(alpha: 0.88),
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(AppSpacing.lg),
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  minScale: 0.7,
                  maxScale: 5,
                  child: Image.asset(certificate.image, fit: BoxFit.contain),
                ),
              ),
              PositionedDirectional(
                top: 0,
                end: 0,
                child: IconButton.filled(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MetaRow extends StatelessWidget {
  final IconData icon;
  final String value;

  const _MetaRow({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 19,
          color: context.colors.onSurface.withValues(alpha: 0.55),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            value,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.68),
            ),
          ),
        ),
      ],
    );
  }
}
