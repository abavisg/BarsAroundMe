## Bars Around Me app - v1.0.0
#### Description
Sample app that gets the user location and is requesting bars around that location from Google Places.
It has 2 views, a list view and a map view. The list view refreshes by natively pulling down the list and the map view has a refresh button.

#### Characteristics
* MVVM as architectural pattern
* RxSwift
* Unit Testing with Quick, Nimble and Mockingjay

#### How to run
Open BarsAroundMe.xcworkspace, chose BarsAroundMeWithLocation scheme and run in a simulator as I've already included a fake location with a .gpx file. Alternatively, choose BarsAroundMe scheme and run on a device (you will have to change the bundle id and signing provisioning profile to one that will allow that app to be installed in that device).

#### Future work
* Remove storyboard and have the controllers and tab bar initializing programmatically
* Decouple home view controller & view model with dependency injection (preferrably by using a DI framework like [Swinject](https://github.com/Swinject/Swinject "Swinject"))
* Add more unit tests to increase code coverage
* Add Jazzy documentation
* Automate with fastlane
* Add different configurations for DEBUG, ADHOC, RELEASE. When running DEBUG or ADHOC generate a different icon with badge (via fastlane), change app name displayed under the app icon.

#### Language
Swift 3.0

#### Minimun supported iOS
iOS 9.0

#### 3rd party libraries & frameworks
* SwiftyJSON
* RxSwift, RxCocoa
* Quick & Nimble for testing
* Mockingjay for stubbing

#### Other tools used
- Cocoapods

## Credits
[Giorgos Ampavis](https://github.com/abavisg "Github profile") - Coder & Technologist - <abavisg@gmail.com>
