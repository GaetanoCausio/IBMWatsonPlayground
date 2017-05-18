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

You need to have a **Bluemix** account to be able to use Watson services, you can request one [here][sign_up].

Add your credentials for the IBM Watson Services into `Credentials.swift`.

Dependency Management: this project is using **carthage**, so please install *carthage* and run `carthage update --platform iOS` in the command line to load the IBM Watson SDK for Swift.

More specific information over the IBM Watson Swift SDK can be found [here](watson_sdk)
## License

This sample code is licensed under Apache 2.0. Full license text is available in [LICENSE][LICENSE].
<BR /><BR />
***
*A continuos learning path where passion is the drive.*

[service_url]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/text-to-speech.html
[cloud_foundry]: https://github.com/cloudfoundry/cli
[getting_started]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/getting_started/
[sign_up]: https://apps.admin.ibmcloud.com/manage/trial/bluemix.html?cm_mmc=WatsonDeveloperCloud-_-LandingSiteGetStarted-_-x-_-CreateAnAccountOnBluemixCLI
[watson_sdk]: https://github.com/watson-developer-cloud/swift-sdk
