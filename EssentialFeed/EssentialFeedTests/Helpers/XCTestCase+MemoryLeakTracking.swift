//
//  XCTestCase+MemoryLeakTracking.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 15/9/25.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeak(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak", file: file, line: line)
        }
    }
}
