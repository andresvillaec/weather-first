// MARK: - Mocks generated from file: iOS_Template/ViewModels/QuestionViewModel.swift at 2019-01-30 16:32:57 +0000

//
//  QuestionsViewModel.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/25/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Cuckoo
@testable import iOS_Template

import Bond
import Foundation
import ReactiveKit

class MockQuestionViewModel: QuestionViewModel, Cuckoo.ClassMock {
    typealias MocksType = QuestionViewModel
    typealias Stubbing = __StubbingProxy_QuestionViewModel
    typealias Verification = __VerificationProxy_QuestionViewModel

    private var __defaultImplStub: QuestionViewModel?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    func enableDefaultImplementation(_ stub: QuestionViewModel) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    
    
     override var questionService: QuestionServiceProtocol {
        get {
            return cuckoo_manager.getter("questionService",
                superclassCall:
                    
                    super.questionService
                    ,
                defaultCall: __defaultImplStub!.questionService)
        }
        
        set {
            cuckoo_manager.setter("questionService",
                value: newValue,
                superclassCall:
                    
                    super.questionService = newValue
                    ,
                defaultCall: __defaultImplStub!.questionService = newValue)
        }
        
    }
    
    
     override var selectedQuestion: Observable<Question> {
        get {
            return cuckoo_manager.getter("selectedQuestion",
                superclassCall:
                    
                    super.selectedQuestion
                    ,
                defaultCall: __defaultImplStub!.selectedQuestion)
        }
        
        set {
            cuckoo_manager.setter("selectedQuestion",
                value: newValue,
                superclassCall:
                    
                    super.selectedQuestion = newValue
                    ,
                defaultCall: __defaultImplStub!.selectedQuestion = newValue)
        }
        
    }
    
    
     override var questionDataManager: DataManagerProtocol {
        get {
            return cuckoo_manager.getter("questionDataManager",
                superclassCall:
                    
                    super.questionDataManager
                    ,
                defaultCall: __defaultImplStub!.questionDataManager)
        }
        
        set {
            cuckoo_manager.setter("questionDataManager",
                value: newValue,
                superclassCall:
                    
                    super.questionDataManager = newValue
                    ,
                defaultCall: __defaultImplStub!.questionDataManager = newValue)
        }
        
    }
    

    

    
    // ["name": "getQuestionsFromApi", "returnSignature": "", "fullyQualifiedName": "getQuestionsFromApi()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func getQuestionsFromApi()  {
        
            return cuckoo_manager.call("getQuestionsFromApi()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    super.getQuestionsFromApi()
                    ,
                defaultCall: __defaultImplStub!.getQuestionsFromApi())
        
    }
    
    // ["name": "selectQuestion", "returnSignature": "", "fullyQualifiedName": "selectQuestion(id: Int)", "parameterSignature": "id: Int", "parameterSignatureWithoutNames": "id: Int", "inputTypes": "Int", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "id", "call": "id: id", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("id"), name: "id", type: "Int", range: CountableRange(1144..<1151), nameRange: CountableRange(1144..<1146))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "id", "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func selectQuestion(id: Int)  {
        
            return cuckoo_manager.call("selectQuestion(id: Int)",
                parameters: (id),
                escapingParameters: (id),
                superclassCall:
                    
                    super.selectQuestion(id: id)
                    ,
                defaultCall: __defaultImplStub!.selectQuestion(id: id))
        
    }
    
    // ["name": "saveToDatabase", "returnSignature": "", "fullyQualifiedName": "saveToDatabase()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func saveToDatabase()  {
        
            return cuckoo_manager.call("saveToDatabase()",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    super.saveToDatabase()
                    ,
                defaultCall: __defaultImplStub!.saveToDatabase())
        
    }
    

	struct __StubbingProxy_QuestionViewModel: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var questionService: Cuckoo.ClassToBeStubbedProperty<MockQuestionViewModel, QuestionServiceProtocol> {
	        return .init(manager: cuckoo_manager, name: "questionService")
	    }
	    
	    var selectedQuestion: Cuckoo.ClassToBeStubbedProperty<MockQuestionViewModel, Observable<Question>> {
	        return .init(manager: cuckoo_manager, name: "selectedQuestion")
	    }
	    
	    var questionDataManager: Cuckoo.ClassToBeStubbedProperty<MockQuestionViewModel, DataManagerProtocol> {
	        return .init(manager: cuckoo_manager, name: "questionDataManager")
	    }
	    
	    
	    func getQuestionsFromApi() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockQuestionViewModel.self, method: "getQuestionsFromApi()", parameterMatchers: matchers))
	    }
	    
	    func selectQuestion<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.ClassStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockQuestionViewModel.self, method: "selectQuestion(id: Int)", parameterMatchers: matchers))
	    }
	    
	    func saveToDatabase() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockQuestionViewModel.self, method: "saveToDatabase()", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_QuestionViewModel: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var questionService: Cuckoo.VerifyProperty<QuestionServiceProtocol> {
	        return .init(manager: cuckoo_manager, name: "questionService", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var selectedQuestion: Cuckoo.VerifyProperty<Observable<Question>> {
	        return .init(manager: cuckoo_manager, name: "selectedQuestion", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var questionDataManager: Cuckoo.VerifyProperty<DataManagerProtocol> {
	        return .init(manager: cuckoo_manager, name: "questionDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func getQuestionsFromApi() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getQuestionsFromApi()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func selectQuestion<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
	        return cuckoo_manager.verify("selectQuestion(id: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func saveToDatabase() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("saveToDatabase()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class QuestionViewModelStub: QuestionViewModel {
    
     override var questionService: QuestionServiceProtocol {
        get {
            return DefaultValueRegistry.defaultValue(for: (QuestionServiceProtocol).self)
        }
        
        set { }
        
    }
    
     override var selectedQuestion: Observable<Question> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<Question>).self)
        }
        
        set { }
        
    }
    
     override var questionDataManager: DataManagerProtocol {
        get {
            return DefaultValueRegistry.defaultValue(for: (DataManagerProtocol).self)
        }
        
        set { }
        
    }
    

    

    
     override func getQuestionsFromApi()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func selectQuestion(id: Int)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func saveToDatabase()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

