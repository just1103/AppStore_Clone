//
//  APIProtocol.swift
//  AppStoreClone
//
//  Created by Hyoju Son on 2022/08/07.
//

import Combine
import Foundation

protocol APIProtocol {
    var url: URL? { get }
    var method: HttpMethod { get }  // TODO: 자체적으로 mappingType을 갖고 있도록 개선하여 fetchData 메서드 활용도 높이기
}

protocol Gettable: APIProtocol {
    func fetchData() -> AnyPublisher<SearchResultDTO, NetworkError>
}

enum HttpMethod {
    case get
    
    var description: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}
