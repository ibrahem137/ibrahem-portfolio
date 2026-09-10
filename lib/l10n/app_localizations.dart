import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Ibrahem Alhuossien | Flutter Developer'**
  String get appTitle;

  /// No description provided for @heroGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, I\'m'**
  String get heroGreeting;

  /// No description provided for @heroName.
  ///
  /// In en, this message translates to:
  /// **'Ibrahem Alhuossien'**
  String get heroName;

  /// No description provided for @heroRole.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer | Software Engineering Student'**
  String get heroRole;

  /// No description provided for @heroDescription.
  ///
  /// In en, this message translates to:
  /// **'I build modern, responsive, and maintainable Flutter applications for mobile and web, with a focus on clean architecture, REST API integration, and scalable user experiences.'**
  String get heroDescription;

  /// No description provided for @viewMyWork.
  ///
  /// In en, this message translates to:
  /// **'View My Work'**
  String get viewMyWork;

  /// No description provided for @downloadCv.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get downloadCv;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @certificates.
  ///
  /// In en, this message translates to:
  /// **'Certificates'**
  String get certificates;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @aboutEyebrow.
  ///
  /// In en, this message translates to:
  /// **'ABOUT ME'**
  String get aboutEyebrow;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'Turning ideas into reliable Flutter experiences.'**
  String get aboutTitle;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'I\'m a fifth-year Software Engineering student at the University of Aleppo and a Flutter developer focused on building modern mobile and web applications. I enjoy transforming ideas and designs into structured, maintainable applications using Flutter, Bloc/Cubit, REST APIs, dependency injection, and feature-based architectures.'**
  String get aboutDescription;

  /// No description provided for @aboutLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get aboutLocationLabel;

  /// No description provided for @aboutLocationValue.
  ///
  /// In en, this message translates to:
  /// **'Aleppo, Syria'**
  String get aboutLocationValue;

  /// No description provided for @aboutStudyLabel.
  ///
  /// In en, this message translates to:
  /// **'Study'**
  String get aboutStudyLabel;

  /// No description provided for @aboutStudyValue.
  ///
  /// In en, this message translates to:
  /// **'Software Engineering'**
  String get aboutStudyValue;

  /// No description provided for @aboutRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get aboutRoleLabel;

  /// No description provided for @aboutRoleValue.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get aboutRoleValue;

  /// No description provided for @aboutFocusLabel.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get aboutFocusLabel;

  /// No description provided for @aboutFocusValue.
  ///
  /// In en, this message translates to:
  /// **'Mobile & Web'**
  String get aboutFocusValue;

  /// No description provided for @skillsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'SKILLS'**
  String get skillsEyebrow;

  /// No description provided for @skillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Technologies I work with.'**
  String get skillsTitle;

  /// No description provided for @skillsDescription.
  ///
  /// In en, this message translates to:
  /// **'A practical toolkit I use to build structured, responsive, and maintainable Flutter applications.'**
  String get skillsDescription;

  /// No description provided for @skillsMobileWeb.
  ///
  /// In en, this message translates to:
  /// **'Mobile & Web'**
  String get skillsMobileWeb;

  /// No description provided for @skillsArchitecture.
  ///
  /// In en, this message translates to:
  /// **'Architecture'**
  String get skillsArchitecture;

  /// No description provided for @skillsStateManagement.
  ///
  /// In en, this message translates to:
  /// **'State Management'**
  String get skillsStateManagement;

  /// No description provided for @skillsApiNetworking.
  ///
  /// In en, this message translates to:
  /// **'API & Networking'**
  String get skillsApiNetworking;

  /// No description provided for @skillsDataServices.
  ///
  /// In en, this message translates to:
  /// **'Data & Services'**
  String get skillsDataServices;

  /// No description provided for @skillsTools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get skillsTools;

  /// No description provided for @experienceEyebrow.
  ///
  /// In en, this message translates to:
  /// **'EXPERIENCE'**
  String get experienceEyebrow;

  /// No description provided for @experienceTitle.
  ///
  /// In en, this message translates to:
  /// **'Practical development experience.'**
  String get experienceTitle;

  /// No description provided for @experienceDescription.
  ///
  /// In en, this message translates to:
  /// **'Experience that helped me strengthen my Flutter development workflow and apply software engineering concepts in real projects.'**
  String get experienceDescription;

  /// No description provided for @experienceInternRole.
  ///
  /// In en, this message translates to:
  /// **'Mobile App Development Intern'**
  String get experienceInternRole;

  /// No description provided for @experienceInternCompany.
  ///
  /// In en, this message translates to:
  /// **'AutoMata4 Group'**
  String get experienceInternCompany;

  /// No description provided for @experienceInternPeriod.
  ///
  /// In en, this message translates to:
  /// **'Internship'**
  String get experienceInternPeriod;

  /// No description provided for @experienceInternLocation.
  ///
  /// In en, this message translates to:
  /// **'Aleppo, Syria'**
  String get experienceInternLocation;

  /// No description provided for @experienceInternDescription.
  ///
  /// In en, this message translates to:
  /// **'Worked on Flutter mobile application development while improving practical skills in UI implementation, application structure, and development workflows.'**
  String get experienceInternDescription;

  /// No description provided for @projectsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'PROJECTS'**
  String get projectsEyebrow;

  /// No description provided for @projectsTitle.
  ///
  /// In en, this message translates to:
  /// **'Selected work.'**
  String get projectsTitle;

  /// No description provided for @projectsDescription.
  ///
  /// In en, this message translates to:
  /// **'A selection of Flutter projects where I applied responsive UI development, structured architecture, state management, and REST API integration.'**
  String get projectsDescription;

  /// No description provided for @projectViewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Project'**
  String get projectViewDetails;

  /// No description provided for @projectSourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source Code'**
  String get projectSourceCode;

  /// No description provided for @projectFeatured.
  ///
  /// In en, this message translates to:
  /// **'Featured Project'**
  String get projectFeatured;

  /// No description provided for @projectOverview.
  ///
  /// In en, this message translates to:
  /// **'Project Overview'**
  String get projectOverview;

  /// No description provided for @projectRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get projectRole;

  /// No description provided for @projectType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get projectType;

  /// No description provided for @projectYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get projectYear;

  /// No description provided for @projectScreenshots.
  ///
  /// In en, this message translates to:
  /// **'Screenshots'**
  String get projectScreenshots;

  /// No description provided for @projectKeyFeatures.
  ///
  /// In en, this message translates to:
  /// **'Key Features'**
  String get projectKeyFeatures;

  /// No description provided for @projectTechStack.
  ///
  /// In en, this message translates to:
  /// **'Tech Stack'**
  String get projectTechStack;

  /// No description provided for @projectSourceCodeDetails.
  ///
  /// In en, this message translates to:
  /// **'Source Code'**
  String get projectSourceCodeDetails;

  /// No description provided for @educationEyebrow.
  ///
  /// In en, this message translates to:
  /// **'EDUCATION'**
  String get educationEyebrow;

  /// No description provided for @educationTitle.
  ///
  /// In en, this message translates to:
  /// **'Academic Background'**
  String get educationTitle;

  /// No description provided for @educationDescription.
  ///
  /// In en, this message translates to:
  /// **'My academic journey in software engineering and information technology.'**
  String get educationDescription;

  /// No description provided for @educationUniversity.
  ///
  /// In en, this message translates to:
  /// **'University of Aleppo'**
  String get educationUniversity;

  /// No description provided for @educationFaculty.
  ///
  /// In en, this message translates to:
  /// **'Faculty of Information Engineering'**
  String get educationFaculty;

  /// No description provided for @educationMajor.
  ///
  /// In en, this message translates to:
  /// **'Software Engineering'**
  String get educationMajor;

  /// No description provided for @educationStatus.
  ///
  /// In en, this message translates to:
  /// **'Fifth-Year Student'**
  String get educationStatus;

  /// No description provided for @educationExpectedGraduation.
  ///
  /// In en, this message translates to:
  /// **'Expected Graduation'**
  String get educationExpectedGraduation;

  /// No description provided for @educationExpectedGraduationValue.
  ///
  /// In en, this message translates to:
  /// **'2027'**
  String get educationExpectedGraduationValue;

  /// No description provided for @certificatesEyebrow.
  ///
  /// In en, this message translates to:
  /// **'CERTIFICATES'**
  String get certificatesEyebrow;

  /// No description provided for @certificatesTitle.
  ///
  /// In en, this message translates to:
  /// **'Certificates & Training'**
  String get certificatesTitle;

  /// No description provided for @certificatesDescription.
  ///
  /// In en, this message translates to:
  /// **'Professional training that strengthened my Flutter and mobile application development skills.'**
  String get certificatesDescription;

  /// No description provided for @certificateView.
  ///
  /// In en, this message translates to:
  /// **'View Certificate'**
  String get certificateView;

  /// No description provided for @contactEyebrow.
  ///
  /// In en, this message translates to:
  /// **'CONTACT'**
  String get contactEyebrow;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Build Something Together'**
  String get contactTitle;

  /// No description provided for @contactDescription.
  ///
  /// In en, this message translates to:
  /// **'I\'m currently open to Flutter development opportunities, collaborations, and interesting projects.'**
  String get contactDescription;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Email Me'**
  String get contactEmail;

  /// No description provided for @contactWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get contactWhatsapp;

  /// No description provided for @contactGithub.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get contactGithub;

  /// No description provided for @contactLinkedin.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get contactLinkedin;

  /// No description provided for @contactInstagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get contactInstagram;

  /// No description provided for @footerText.
  ///
  /// In en, this message translates to:
  /// **'Built with Flutter by Ibrahem Alhuossien'**
  String get footerText;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @navSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get navSkills;

  /// No description provided for @navExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get navExperience;

  /// No description provided for @navProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// No description provided for @navEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get navEducation;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @lightModeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get lightModeTooltip;

  /// No description provided for @darkModeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkModeTooltip;

  /// No description provided for @projectB2bDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'B2B Smart Ordering System — Admin Dashboard'**
  String get projectB2bDashboardTitle;

  /// No description provided for @projectB2bDashboardShortDescription.
  ///
  /// In en, this message translates to:
  /// **'A modern admin dashboard for managing suppliers, stores, products, orders, sales, and business analytics.'**
  String get projectB2bDashboardShortDescription;

  /// No description provided for @projectB2bDashboardFullDescription.
  ///
  /// In en, this message translates to:
  /// **'A Flutter-based admin dashboard developed as part of a B2B Smart Ordering System for supermarkets. The dashboard provides centralized management for suppliers, stores, categories, products, supplier offers, purchase orders, sales, and analytics through a responsive and maintainable interface.'**
  String get projectB2bDashboardFullDescription;

  /// No description provided for @projectB2bMobileTitle.
  ///
  /// In en, this message translates to:
  /// **'B2B Smart Ordering System — Mobile App'**
  String get projectB2bMobileTitle;

  /// No description provided for @projectB2bMobileShortDescription.
  ///
  /// In en, this message translates to:
  /// **'A Flutter mobile application for store operations, catalog browsing, ordering, inventory, offers, and account management.'**
  String get projectB2bMobileShortDescription;

  /// No description provided for @projectB2bMobileFullDescription.
  ///
  /// In en, this message translates to:
  /// **'A Flutter mobile application developed as part of the B2B Smart Ordering System. It supports store authentication, catalog browsing, order management, supplier offers, inventory and stock tracking, account ledger information, profile management, and multilingual user experiences.'**
  String get projectB2bMobileFullDescription;

  /// No description provided for @projectGymDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Gym Management Dashboard'**
  String get projectGymDashboardTitle;

  /// No description provided for @projectGymDashboardShortDescription.
  ///
  /// In en, this message translates to:
  /// **'A responsive Flutter dashboard for managing gym members, trainers, check-ins, reports, and business analytics.'**
  String get projectGymDashboardShortDescription;

  /// No description provided for @projectGymDashboardFullDescription.
  ///
  /// In en, this message translates to:
  /// **'A Flutter-based gym management dashboard built as a university project. It provides tools for managing members, trainers, check-ins, reports, revenue analytics, attendance, and dashboard statistics through a responsive web interface.'**
  String get projectGymDashboardFullDescription;

  /// No description provided for @projectTypeWebDashboard.
  ///
  /// In en, this message translates to:
  /// **'Web Dashboard'**
  String get projectTypeWebDashboard;

  /// No description provided for @projectTypeMobileApplication.
  ///
  /// In en, this message translates to:
  /// **'Mobile Application'**
  String get projectTypeMobileApplication;

  /// No description provided for @projectRoleFlutterDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get projectRoleFlutterDeveloper;

  /// No description provided for @projectFeatureAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Dashboard Analytics'**
  String get projectFeatureAnalytics;

  /// No description provided for @projectFeatureSuppliers.
  ///
  /// In en, this message translates to:
  /// **'Supplier Management'**
  String get projectFeatureSuppliers;

  /// No description provided for @projectFeatureStores.
  ///
  /// In en, this message translates to:
  /// **'Store Management'**
  String get projectFeatureStores;

  /// No description provided for @projectFeatureCategories.
  ///
  /// In en, this message translates to:
  /// **'Category Management'**
  String get projectFeatureCategories;

  /// No description provided for @projectFeatureMasterProducts.
  ///
  /// In en, this message translates to:
  /// **'Master Product Management'**
  String get projectFeatureMasterProducts;

  /// No description provided for @projectFeatureSupplierProducts.
  ///
  /// In en, this message translates to:
  /// **'Supplier Product Management'**
  String get projectFeatureSupplierProducts;

  /// No description provided for @projectFeatureOrders.
  ///
  /// In en, this message translates to:
  /// **'Order Management'**
  String get projectFeatureOrders;

  /// No description provided for @projectFeatureSales.
  ///
  /// In en, this message translates to:
  /// **'Sales Management'**
  String get projectFeatureSales;

  /// No description provided for @projectFeatureSearchFilter.
  ///
  /// In en, this message translates to:
  /// **'Search & Filtering'**
  String get projectFeatureSearchFilter;

  /// No description provided for @projectFeatureLocalizationThemes.
  ///
  /// In en, this message translates to:
  /// **'Localization & Themes'**
  String get projectFeatureLocalizationThemes;

  /// No description provided for @projectFeatureAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get projectFeatureAuthentication;

  /// No description provided for @projectFeatureCatalog.
  ///
  /// In en, this message translates to:
  /// **'Product Catalog'**
  String get projectFeatureCatalog;

  /// No description provided for @projectFeatureOffers.
  ///
  /// In en, this message translates to:
  /// **'Supplier Offers'**
  String get projectFeatureOffers;

  /// No description provided for @projectFeatureInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory Management'**
  String get projectFeatureInventory;

  /// No description provided for @projectFeatureStock.
  ///
  /// In en, this message translates to:
  /// **'Stock Tracking'**
  String get projectFeatureStock;

  /// No description provided for @projectFeatureLedger.
  ///
  /// In en, this message translates to:
  /// **'Account Ledger'**
  String get projectFeatureLedger;

  /// No description provided for @projectFeatureProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile Management'**
  String get projectFeatureProfile;

  /// No description provided for @projectFeatureLocalization.
  ///
  /// In en, this message translates to:
  /// **'Multi-language Support'**
  String get projectFeatureLocalization;

  /// No description provided for @projectFeatureSecureAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Secure Authentication'**
  String get projectFeatureSecureAuthentication;

  /// No description provided for @projectFeatureMembers.
  ///
  /// In en, this message translates to:
  /// **'Member Management'**
  String get projectFeatureMembers;

  /// No description provided for @projectFeatureTrainers.
  ///
  /// In en, this message translates to:
  /// **'Trainer Management'**
  String get projectFeatureTrainers;

  /// No description provided for @projectFeatureCheckIn.
  ///
  /// In en, this message translates to:
  /// **'Member Check-in'**
  String get projectFeatureCheckIn;

  /// No description provided for @projectFeatureReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get projectFeatureReports;

  /// No description provided for @projectFeatureRevenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue Analytics'**
  String get projectFeatureRevenue;

  /// No description provided for @projectFeatureSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get projectFeatureSettings;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
