import '../../../l10n/app_localizations.dart';

abstract final class ProjectLocalization {
  static String text(AppLocalizations l10n, String key) {
    switch (key) {
      case 'projectB2bDashboardTitle':
        return l10n.projectB2bDashboardTitle;
      case 'projectB2bDashboardShortDescription':
        return l10n.projectB2bDashboardShortDescription;
      case 'projectB2bDashboardFullDescription':
        return l10n.projectB2bDashboardFullDescription;

      case 'projectB2bMobileTitle':
        return l10n.projectB2bMobileTitle;
      case 'projectB2bMobileShortDescription':
        return l10n.projectB2bMobileShortDescription;
      case 'projectB2bMobileFullDescription':
        return l10n.projectB2bMobileFullDescription;

      case 'projectGymDashboardTitle':
        return l10n.projectGymDashboardTitle;
      case 'projectGymDashboardShortDescription':
        return l10n.projectGymDashboardShortDescription;
      case 'projectGymDashboardFullDescription':
        return l10n.projectGymDashboardFullDescription;

      case 'projectTypeWebDashboard':
        return l10n.projectTypeWebDashboard;
      case 'projectTypeMobileApplication':
        return l10n.projectTypeMobileApplication;

      case 'projectRoleFlutterDeveloper':
        return l10n.projectRoleFlutterDeveloper;

      case 'projectFeatureAnalytics':
        return l10n.projectFeatureAnalytics;
      case 'projectFeatureSuppliers':
        return l10n.projectFeatureSuppliers;
      case 'projectFeatureStores':
        return l10n.projectFeatureStores;
      case 'projectFeatureCategories':
        return l10n.projectFeatureCategories;
      case 'projectFeatureMasterProducts':
        return l10n.projectFeatureMasterProducts;
      case 'projectFeatureSupplierProducts':
        return l10n.projectFeatureSupplierProducts;
      case 'projectFeatureOrders':
        return l10n.projectFeatureOrders;
      case 'projectFeatureSales':
        return l10n.projectFeatureSales;
      case 'projectFeatureSearchFilter':
        return l10n.projectFeatureSearchFilter;
      case 'projectFeatureLocalizationThemes':
        return l10n.projectFeatureLocalizationThemes;
      case 'projectFeatureAuthentication':
        return l10n.projectFeatureAuthentication;
      case 'projectFeatureCatalog':
        return l10n.projectFeatureCatalog;
      case 'projectFeatureOffers':
        return l10n.projectFeatureOffers;
      case 'projectFeatureInventory':
        return l10n.projectFeatureInventory;
      case 'projectFeatureStock':
        return l10n.projectFeatureStock;
      case 'projectFeatureLedger':
        return l10n.projectFeatureLedger;
      case 'projectFeatureProfile':
        return l10n.projectFeatureProfile;
      case 'projectFeatureLocalization':
        return l10n.projectFeatureLocalization;
      case 'projectFeatureSecureAuthentication':
        return l10n.projectFeatureSecureAuthentication;
      case 'projectFeatureMembers':
        return l10n.projectFeatureMembers;
      case 'projectFeatureTrainers':
        return l10n.projectFeatureTrainers;
      case 'projectFeatureCheckIn':
        return l10n.projectFeatureCheckIn;
      case 'projectFeatureReports':
        return l10n.projectFeatureReports;
      case 'projectFeatureRevenue':
        return l10n.projectFeatureRevenue;
      case 'projectFeatureSettings':
        return l10n.projectFeatureSettings;

      default:
        return key;
    }
  }
}
