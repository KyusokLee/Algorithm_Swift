//
//  main.swift
//  API_Tech
//
//  Created by Kyus'lee on 2022/05/20.
//

import Foundation

//swift言語を用いたAPIのRequest and Get Data
// terminal curl -i (URL Address) -> urlのip値が json データにreturn される
public struct Battle: Codable {
    let winner: String
    let loser: String
}

private func get() {
    let urlString = "https://ob6la3c120.execute-api.ap-northeast-1.amazonaws.com/Prod/battle/dragon+griffin"

    guard let url = URLComponents(string: urlString) else {
        return
    }

    // HTTPメソッドを実行
    let task = URLSession.shared.dataTask(with: url.url!) {(data, response, error) in
        if (error != nil) {
            print(error!.localizedDescription)
        }

        guard let _data = data else {
            // dataがnilだったら -> return
            return
        }

        // JSONデコード
        let users = try! JSONDecoder().decode(Battle.self, from: _data)
        print("winner:\(users.winner) loser:\(users.loser)")
    }

    task.resume()
}

get()

//let json = """
//{
//    "name": "tommy's blog",
//    "posts_count": 20,
//    "image_url": "https://jusung.github.io",
//    "views": 1000,
//    "tag_line": "Happy Swift Coding"
//}
//""".data(using: .utf8)!
//
//struct Blog: Decodable {
//    let name: String
//    let postsCount: Int
//    let imageUrl: URL
//    let views: Int
//    let tagLine: String
//}
//
//let decoder = JSONDecoder()
//decoder.keyDecodingStrategy = .convertFromSnakeCase // keyDecodingStrategy를 지정
//let blog: Blog = try decoder.decode(Blog.self, from: json)

//public struct UserInfo: Codable {
//    public let ip: String
//}
//
//func getMyIP(compilationHandler: @escaping (UserInfo) -> Void) {
//    guard let url:URL = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-06-09&sortBy=publishedAt&apiKey=something") else {
//        return
//    }
//    var urlReq: URLRequest = URLRequest.init(url: url)
//
//    urlReq.httpMethod = "GET"
//    urlReq.allHTTPHeaderFields = ["Content-Type":"application/json"]
//
//    let IPTask = URLSession.shared.dataTask(with: urlReq) { (data, res, err) in
//        if let data = data {
//            let jsonData = try? JSONDecoder().decode(UserInfo.self, from: data)
//            guard let rsData = jsonData else {
//                return
//            }
//            compilationHandler(rsData)
//        }
//    }
//
//    IPTask.resume()
//}


//func HttpGet(urlString: String) {
//
//    guard let url = URL(string: urlString) else {return}
//
//    let session = URLSession(configuration: .default)
//    let dataTask: Void = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
//
//        guard let data = data else {return}
//        do {
//            //받은 json데이터 파싱
//            let result: Articles = try JSONDecoder().decode(Articles.self, from: data)
//            print(result.articles.first?.author)
//        } catch(let e) {
//            print(e)
//        }
//    }.resume()   //모든 task()는 일시정지 상태로 시작하기 때문에 resume()으로 task()를 시작해야합니다.
//}

