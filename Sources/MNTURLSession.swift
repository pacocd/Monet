//
//  MNTURLSession.swift
//  Monet
//
//  Created by Francisco Javier Chacon de Dios on 16/04/21.
//  Copyright © 2021 Monet. All rights reserved.
//

import Foundation

public class MNTURLSession: NSObject, MNTMockableURLSession {
    public func setMock(_ mock: MNTMock) {}

    public func clearMocks() {}

    public func dataTask(request: URLRequest,
                  _ completionHandler: @escaping DataTaskResult) -> MNTMockableDataTask {
        return URLSession.shared.dataTask(with: request,
                                          completionHandler: completionHandler)
    }
}
