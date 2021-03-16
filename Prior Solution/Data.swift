//
//  Data.swift
//  Prior Solution
//
//  Created by มิตรภาพ สกุลพิสุทธิ์ on 16/3/21.
//

import Foundation

class Data{
    var Result : [MyResults?] = []
    var count = 1
    func getData(from url:String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else{
                print("error")
                return
            }
            
            var result: Response?
            
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
            guard let json = result else{
                return
            }
            self.Result += json.results
            self.count = json.info.count
            let url2: String
            url2 = json.info.next ?? "0"
            if(url2 != "0"){
                self.getData(from: url2)
            }
        })
        task.resume()
        
    }
}
struct Response: Codable {
    let info: MyInfo
    let results: [MyResults]
}
struct MyInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
}
struct MyResults: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: MyOrigin
    let location: MyLocation
    let image: String?
    let episode: [String]
    let url: String?
    let created: String
}
struct MyOrigin: Codable{
    let name: String
    let url: String
}
struct MyLocation: Codable {
    let name: String
    let url: String
}
    
