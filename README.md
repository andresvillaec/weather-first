# iOS Template

This project is template to start an iOS Project using *MVVM*. **TDD** is heavaly recommended. To learn more about MVVM in iOS development, please visit [model-view-viewmodel-architecture-for-ios] [1].

## General information

####Project Laoyout

The corrext approach should be by group files and directories by **functionality**

```
\---ProjectName
	\---Environment
    \---Common
	\---Login
    	\---Networking
        	|	LoginNetworkManager.swift
        \---DataManager
        	|	LoginDataManager.swift
        \---ViewModel
        	|	LoginViewModel.swift
        \---ViewController
        	|	Login.storyboard
        	|	LoginViewController.swift
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

