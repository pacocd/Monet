//
//  MNTURLSessionMock.swift
//  Monet
//
//  Created by Francisco Javier Chacon de Dios on 19/04/21.
//  Copyright © 2021 Monet. All rights reserved.
//

import Foundation

public class MNTURLSessionMock: NSObject, MNTMockableURLSession {
    public var mocks: [MNTMock] = []

    public func setMock(_ mock: MNTMock) {
        if mocks.contains(mock) {
            let index = mocks.firstIndex(of: mock)!
            mocks.remove(at: index)
        }
        mocks.append(mock)
    }

    public func clearMocks() { mocks.removeAll() }

    public func dataTask(request: URLRequest,
                  _ completionHandler: @escaping DataTaskResult) -> MNTMockableDataTask {
        let predicate: (MNTMock) -> Bool = { mock in
            request.url!.toString() == mock.urlConvertible.toString() &&
                request.httpMethod == mock.method.getValue()
        }
        return MNTURLSessionDataTaskMock(mock: mocks.first(where: predicate),
                                         completionHandler: completionHandler)

    }
}
