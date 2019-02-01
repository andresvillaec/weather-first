# iOS Template

This project is template to start an iOS Project using *MVVM*. **TDD** is heavaly recommended. To learn more about MVVM in iOS development, please visit [model-view-viewmodel-architecture-for-ios] [1].

## General information

####Project Laoyout

The correct approach should be group files and directories by **functionality**

```
\---ProjectName
	\---Environment
    \---Common
	\---Login
    	|
    	+---Networking
        |	|	LoginNetworkManager.swift
        +---DataManager
        |	|	LoginDataManager.swift
        +---ViewModel
        |	|	LoginViewModel.swift
        \---ViewController
        		Login.storyboard
        		LoginViewController.swift
```



#### Pods

To install CocoaPods please go to [CocoaPods] [2]

##### App

 Pod								| Description								
------------------------------------|------------------------------------------- 
 [`Moya/ReactiveSwift`] [moya]		| Consume HTTP Apis making calls reactive	
 [`ObjectMapper`] [om]				| JSON to Objects and Objects to JSON		
 [`Bond`] [bond]					| Bind ViewControllers to ViewModels
 [`RealmSwift`] [rs]				| Database
 [`Swinject`] [sj]					| Dependency Injection
 
 
##### Tests

 Pod								| Description								
------------------------------------|------------------------------------------- 
 [`Quick`] [moya]					| BDD Framework	
 [`Nimble`] [om]					| Matcher for tests		
 [`Mockingjay`] [bond]				| Stub HTTP requests
 [`Cuckoo`] [rs]					| Mock objects



## How to use

#### Set up the project

 1. Clone the repo into a new repository.
 2. Open iOS_Template.xcodeproj
 3. Select iOS_Template target and on the file inspector change the name according to the project **(on the popup select rename)**
 4. Change the main directory name to the new target name
 5. Open Podfile and change the target name to the new target name
 6. Delete Pods\_iOS\_Template.framework from all Targets in `Build Phases - Link Binary With Libraries`
 7. Change @testable import target to your new target on all iOS_Tests swift classes
 8. Run pod install
 9. Build and run the tests to confirm everything works fine
 


### Add new Environments

 1. Add new scheme
 2. Add environment-Info.plist (clone from Info.plist)
 3. Add Environment.xcconfig
 4. On Project - Info :
 	- Add configuration for debug and release
    - On both debug and release configuration select the matching configuration file **(only for the project)**
 5. Run pod install *(this will autocomplete the configuration file for the different targets)*


### Extras

#### Cuckoo

When mocking classes using **Cuckoo** you need to add those classes to the `Cuckoo script`, then build the project. The script should be located on `target - Build Phases`. After building the project the _GeneratedMocks.swift_ file located in `iOS_Tests/Mocks` will be updated with the new mocks, if not, please check the logs for any warnings regarding mock generation *this won't throw and error*

#### Cuckoo mock script

```
OUTPUT_FILE="$PROJECT_DIR/iOS_Tests/GeneratedMocks.swift"
echo "Generated Mocks File = $OUTPUT_FILE"

# Define input directory. Change "${PROJECT_DIR}/${PROJECT_NAME}" to your project's root source folder, if it's not the default name.
INPUT_DIR="${PROJECT_DIR}/${PROJECT_NAME}"
echo "Mocks Input Directory = $INPUT_DIR"

# Generate mock files, include as many input files as you'd like to create mocks for.
"${PODS_ROOT}/Cuckoo/run" generate --testable "$PROJECT_NAME" \
--output "${OUTPUT_FILE}" \
"$INPUT_DIR/ViewModels/QuestionViewModel.swift"

# ... and so forth, the last line should never end with a backslash

# After running once, locate `GeneratedMocks.swift` and drag it into your Xcode test target group.

```
 





[1]: https://medium.com/flawless-app-stories/how-to-use-a-model-view-viewmodel-architecture-for-ios-46963c67be1b 

[2]: https://guides.cocoapods.org/using/getting-started.html

[moya]: https://github.com/Moya/Moya
[om]: https://github.com/tristanhimmelman/ObjectMapper
[bond]: https://github.com/DeclarativeHub/Bond
[rs]: https://realm.io/docs/swift/latest/
[sj]: https://github.com/Swinject/Swinject
[quick]: https://github.com/Quick/Quick
[NImble]: https://github.com/Quick/Nimble
[Mockinjay]: https://github.com/kylef/Mockingjay
[Cuckoo]: https://github.com/Brightify/Cuckoo

