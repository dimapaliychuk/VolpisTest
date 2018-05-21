//
//  API.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import Moya
import Alamofire


enum API {
    case getPlaces
}


extension API: TargetType{
    
    var baseURL: URL {
        return URL(string: "http://zavtrakov.eurodir.ru")!
    }
    
    var path: String {
        switch self {
        case .getPlaces:
            return "/response.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getPlaces:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Typer": "application/json"]
    }
    
    
}
