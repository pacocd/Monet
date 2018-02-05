//
//  Request.swift
//  FCNetwork
//
//  Created by Francisco Javier Chacon de Dios on 04/02/18.
//

import Foundation

public enum HTTPMethod {
    case get, put, patch, post, delete

    public func getValue() -> String {
        switch self {
        case .get:
            return "GET"
        case .put:
            return "PUT"
        case .patch:
            return "PATCH"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        }
    }
}

public typealias Headers = [String: String]

public typealias Parameters = [String: Any]

public typealias ResponseResult = [String: Any]

public protocol URLString {
    func toURL() -> URL?
}

extension String: URLString {

    public func toURL() -> URL? {
        if let url = URL(string: self) {
            return url
        } else {
            return nil
        }
    }

}
