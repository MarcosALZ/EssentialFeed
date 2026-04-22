//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by Israel Marcos Alvarez Mesa on 22/4/26.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
