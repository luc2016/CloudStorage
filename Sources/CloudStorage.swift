//
//  CloudStorage.swift
//  CloudStorage
//
//  Created by Lu Cui (LCL) on 2018-06-18.
//  Copyright © 2018 lcl. All rights reserved.
//

import Foundation
import AWSS3
import AWSCognito
import XCTest

public protocol CloudStorage {
    func authenticate()
    func uploadImage(imageURL: URL) throws -> String
}
