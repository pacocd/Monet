//
//  MNTMockFile.swift
//  Monet
//
//  Created by Francisco Javier Chacon de Dios on 07/04/21.
//  Copyright © 2021 Monet. All rights reserved.
//

import Foundation

class MNTMockFile: MNTMockableResponseBody {
    var filename: String
    var fileExtension: String
    var bundle: Bundle
    var fullName: String { "\(filename).\(fileExtension)" }
    var path: String? {
        return bundle.path(forResource: filename, ofType: fileExtension)
    }

    init(filename: String, fileExtension: String, bundle: Bundle = .main) {
        self.filename = filename
        self.fileExtension = fileExtension
        self.bundle = bundle
    }

    func toData() throws -> Data {
        guard let path = path, path.isEmpty == false else {
            throw MNTError.MockFailReason.unreadableMockFile(file: fullName)
        }
        guard let data = try? Data(contentsOf: try path.toUrl()) else {
            throw MNTError.MockFailReason.unreadableMockFile(file: fullName)
        }

        return data
    }
}