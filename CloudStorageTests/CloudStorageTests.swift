//
//  CloudStorageTests.swift
//  CloudStorageTests
//
//  Created by Lu Cui (LCL) on 2018-06-18.
//  Copyright © 2018 lcl. All rights reserved.
//

import XCTest

enum NetWorkError:Error{
    case uploadfailed
}


class S3MockUploadSuccess : CloudStorage {
    var authenticationCallCount = 0
    var uploadImageWasCallCount = 0
    
    func uploadImage(imageURL: URL) throws -> String {
        uploadImageWasCallCount += 1
        return "http:s3/uitm2/abcd.jpg"
    }
    
    func authenticate() {
        authenticationCallCount += 1
    }
}

class S3MockUploadFail : CloudStorage {
    var authenticationCallCount = 0
    var uploadImageWasCallCount = 0
    
    func uploadImage(imageURL: URL) throws -> String {
        uploadImageWasCallCount += 1
        throw NetWorkError.uploadfailed
    }
    
    func authenticate() {
        authenticationCallCount += 1
    }
}

class CloudStorageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testS3Authenticate() {
        let s3 = S3MockUploadSuccess()
        s3.authenticate()
    }
    
}
