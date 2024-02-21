# Flickr Photos App
## Discover the World Through Images with Flickr Photos
Discover stunning photos from around the world with the Flickr Photos app. Effortlessly search for images, save favorite searches, and explore past searches. Share your finds easily and stay inspired with daily uploads. Download now and dive into a visual journey like never before!

## Getting Started
### Environment Dependencies
- Xcode 15+
- iOS 16+
- SwiftUI
- Swift Package Manager(SPM) Dependencies
- Bundler Dependencies
	- [swift-depedendencies](https://github.com/pointfreeco/swift-dependencies): A dependency management library inspired by SwiftUI's "environment."
### Project Setup
1. Clone the repository.
2. Finally, navigate to the root folder run Xcode
<br><br>

## How to use app
To initiate a photo search, simply enter the desired photo name in the search bar, and the API request will be automatically triggered. Each successful search query will persistently store the search term for future reference.

### App Video
![Alt text](README_FILES/App.gif?raw=true "Flickr App")

## Project Structure
iOS Project implemented with Clean Layered Architecture and MVVM. 

## Layers
* **Domain Layer** = Entities + Use Cases + Repositories Interfaces
* **Data Repositories Layer** = Repositories Implementations + API (Network)
* **Presentation Layer (MVVM)** = ViewModels + Views

### Dependency Direction
![Alt text](README_FILES/CleanArchitectureDependencies.png?raw=true "Modules Dependencies")

* **FlickrApp**(iOS Project): This folder contains the resources, source files and all other miscellaneous files to build the iOS project. This folder is further branched into:
	 The app is completely written in SwiftUI/Combine.
	 
## Includes
* Infinite scrolling
* Seach History


## What needs to be improved ##
### Required
1. Improve unit test coverage.
2. Add logging and error handling

### Tools
 1. - [Arkana](https://github.com/rogerluan/arkana) is used to handle/manage/store project keys secretely.
Arkana requires the declaration of a YAML config file, named e.g. `.arkana.yml` that lists the keys (names) and an `.env` (e.g. `.env.arkana`) file that stores the values for the keys stored in the YAML file. Since the `.env.arkana` file contains the actual values of the secrets, it should be stored locally and never be checked-in to the repository (It has already been added to `.gitignore`).
2. - [SwiftGen](https://github.com/SwiftGen/SwiftGen) is a tool allowing to parse the app's various assets (including but not limited to xibs, storyboards, fonts, assets library, strings file, etc). This app is built to use SwiftGen to generate 3 kinds of compile-time constants related to:
3. - [SwiftLint](https://github.com/realm/SwiftLint/) is a tool that parses `swift` files, and output warnings when a code-smell is identified. Sometimes, SwiftLint outputs warnings for desired code, and in these cases the warnings may be disabled in code.
