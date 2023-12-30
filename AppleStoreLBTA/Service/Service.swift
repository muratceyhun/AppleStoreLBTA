//
//  Service.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 29.12.2023.
//

import Foundation


class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        
        print("Fetcing itunes apps from Service Layer")

            let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
            guard let url = URL(string: urlString) else {return}


            URLSession.shared.dataTask(with: url) { data, response, err in

                if let err = err {
                    print("Failed to fetch data", err)
                    completion([], err)
                    return
                }

    //            print(data)
    //            print(String(data: data ?? Data(), encoding: .utf8))

                guard let data = data else {return}

                do {

                   let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//                    print("*******")
//                    searchResult.results.forEach{print($0.trackCensoredName, "|", $0.primaryGenreName)}
                    
                    completion(searchResult.results, nil)
                   

                } catch let err {
                    print("Failed to decode data", err)
                    completion([], err)
                    return
                }

            }.resume()
        }
}
