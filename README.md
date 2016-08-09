# AdyenCSE-iOS
This repository contains Adyen's Client Side Encryption (CSE) library for iOS. With CSE card data is encrypted within the client, in this case the iOS device, before you submit it via your own server to the Adyen API. By using CSE you reduce your scope of PCI compliance, because no raw card data travels through your server. This repository can be leveraged as a starting point to integrate Adyen's payment functionality fully in-app.

## Requirements
The AdyenCSE-iOS library is written in Objective-C and is compatible with apps supporting iOS 7.0 and up. Looking for the Android or web equivalent? We have the CSE library also available written in Java ([AdyenCSE-Android](https://github.com/Adyen/AdyenCSE-Android)) and JavaScript ([AdyenCSE-web](https://github.com/Adyen/CSE-JS)).

All our CSE libraries rely on you [setting up your own server](https://docs.adyen.com/developers/easy-encryption#cardintegration) for communicating with the Adyen API. By using a server you ensure that API authentication credentials never get exposed. Please note that you need to have [signed up for an account at Adyen](https://www.adyen.com/signup) before you can send requests to the Adyen API.

## Example

For you convenience we've included an example app in this repository that can be used as a reference while integrating. 

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

AdyenCSE is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AdyenCSE"
```

## Usage

```obj-c
#import "AdyenCSE/AdyenCSE.h"

//	Set public key
NSString *publicKey = @"10001|B243E873CB9220BAFE71...";

//	Create card object
ADYCard *card = [ADYCard new];
card.generationtime = [NSDate new];
card.number = @"55551...";
card.holderName = @"John A...";
card.cvc = @"737";
card.expiryMonth = @"08";
card.expiryYear = @"2018";

//	Encrypt card data
NSData *cardData = [card encode];
NSString *encryptedCard = [ADYEncrypter encrypt:cardData publicKeyInHex:publicKey];
```

For you convenience we've included an example app in this repository that can be used as a reference while integrating. Please note that you'll have to URL encode the `encryptedCard` before sending it from the app to your server, as the `encryptedCard` which is generated by the CSE library should be exactly the same as you send it from the server to the Adyen API.

## What's next?
After having developed your app, set up the merchant server and succesfully performed your first [test payment](https://docs.adyen.com/developers/test-cards-manual) it's time to complete your integration by registering for Aydyen's notification service. After each payment initiation we push a notification to your server with the authorisation reponse, so you can be sure whether you can start delivering your goods or services. To subscribe to and integrate with the notification service, please check our [notification manual](https://docs.adyen.com/developers/api-manual#notifications).

Succesfully subscribed to and integrated with our notification service? Congratulations, now it's time to start accepting payments for real! Assuming that you've been using your Adyen test account, and the Adyen API's test endpoints, you can now make use of your Adyen live account and Adyen API's [live endpoints](https://docs.adyen.com/developers/api-manual#apiendpoints). Questions? Contact your account manager or send your inquery to [support@adyen.com](mailto:support@adyen.com).

## License

AdyenCSE is available under the MIT license. See the LICENSE file for more info.

