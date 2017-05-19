# IBMWatsonPlayground

[![Shippable](https://img.shields.io/badge/platform-iOS-blue.svg)]()
[![Shippable](https://img.shields.io/badge/language-swift-orange.svg)]()
[![Shippable](https://img.shields.io/badge/packagemanager-carthage-yellow.svg)]()
[![Shippable](https://img.shields.io/badge/build-passing-green.svg)]()
[![Shippable](https://img.shields.io/badge/tests-passing-green.svg)]()
[![Shippable](https://img.shields.io/badge/coverage-n%2Fa-green.svg)]()
[![Shippable](https://img.shields.io/badge/license-apache%202.0-lightgrey.svg)]()

A sample project to demonstrate usage of IBM Watson API's in Swift.   

**--- work in progress ---**

List of IBM Watson API services being used within this project:

| Service  | Status | Description |
| ------------- | ------------- | ----- |
| `ConversationV1`  | = | Build chatbots that understand natural language  |
| `DiscoveryV1`  | = | Cognitive search and content analytics engine |
| `DocumentConversionV1`  | = | Transform documents into different formats |
| `LanguageTranslatorV2`  | w | Translate content into multiple languages |
| `NaturalLanguageClassifierV1`  | = | Interpret and classify natural language  |
| `NaturalLanguageUnderstandingV1`  | w | Advanced text analysis of natural language  |
| `PersonalityInsightsV3`  | w | Understand personality characteristics  |
| `RetrieveAndRankV1`  | = | Enhance information with machine learning |
| `SpeechToTextV1`  | w | Convert human voice into written word |
| `TextToSpeechV1`  | w | Enable computers to speak like humans |
| `ToneAnalyzerV3`  | w | Understand tone and style in written text |
| `VisualRecognitionV3`  | w | Understand image content, find human faces |

legenda (availability in this project): 

= : not working on this service at the moment    
w : work in progress, not yet implemented / tested      
x : completed and tested

## Getting Started

You need to have a **Bluemix** account to be able to use Watson services, you can request one here: [Bluemix Signup][bluemix].

Dependency Management: this project is using **carthage**, so please install *carthage* if you don't have it yet by following instructions on this link: [Carthage Install][carthage_setup].

More specific information over the IBM Watson Swift SDK can be found here: [IBM Watson Swift SDK][watson_sdk]

## Xcode Project Setup

1. Run `carthage update --platform iOS` in the command line to load the IBM Watson SDK for Swift

2. Remove folder group `Private` from the project as this contains references to files with personal data not published to Github.

3. Add your credentials for the IBM Watson Services into `Credentials.swift`.

## Usefull Links

[IBM Bluemix][bluemix]
[IBM Watson API Documentation](https://www.ibm.com/watson/developercloud/services-catalog.html)
[IBM Watson Swift SDK][watson_sdk]
[Carthage](https://github.com/Carthage/)

## License

This sample code is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE).
<BR /><BR />
***
*A continuos learning path where passion is the drive.*

[getting_started]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/getting_started/
[bluemix]: https://bluemix.net
[watson_sdk]: https://github.com/watson-developer-cloud/swift-sdk
[carthage_setup]: https://github.com/Carthage/Carthage/releases
