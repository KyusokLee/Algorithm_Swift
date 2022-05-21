//
//  apiExample.swift
//  API_Tech
//
//  Created by Kyus'lee on 2022/05/20.
//

import Foundation

//swift言語を用いたAPIのRequest and Get Data
// terminal curl -i (URL Address) -> urlのip値が json データにreturn される

public struct UserInfo: Codable {
    public let ip: String
}

func getMyIP(compilationHandler: @escaping (UserInfo) -> Void) {
    guard let url:URL = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-06-09&sortBy=publishedAt&apiKey=something") else {
        return
    }
    var urlReq: URLRequest = URLRequest.init(url: url)
    
    urlReq.httpMethod = "GET"
    urlReq.allHTTPHeaderFields = ["Content-Type":"application/json"]
    
    let IPTask = URLSession.shared.dataTask(with: urlReq) { (data, res, err) in
        if let data = data {
            let jsonData = try? JSONDecoder().decode(UserInfo.self, from: data)
            guard let rsData = jsonData else {
                return
            }
            compilationHandler(rsData)
        }
    }
    
    IPTask.resume()
}
