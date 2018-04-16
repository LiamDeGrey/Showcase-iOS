//
// Created by Liam De Grey on 16/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

struct ErrorDto: Error, Codable {
    let statusCode: Int
    let message: String

    init(statusCode: Int, message: String) {
        self.statusCode = statusCode
        self.message = message
    }

    private enum CodingKeys: String, CodingKey {
        case statusCode
        case message = "error"
    }
}