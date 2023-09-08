//
//  MockResponseValidator.swift
//  Connectivity
//
//  Created by Ross Butler on 14/05/2022.
//  Copyright © 2022 Ross Butler. All rights reserved.
//

@testable import Connectivity
import Foundation

class MockResponseValidator: ResponseValidator {
    private let isResponseValid: Bool
    private (set) var isResponseValidCalled = false
    private (set) var lastData: Data?
    private (set) var lastResponse: URLResponse?
    private (set) var lastURL: URL?
    
    init(isResponseValid: Bool = true) {
        self.isResponseValid = isResponseValid
    }
    
    func isResponseValid(url: URL, response: URLResponse?, data: Data?) -> Bool {
        isResponseValidCalled = true
        lastData = data
        lastResponse = response
        lastURL = url
        return isResponseValid
    }
}
