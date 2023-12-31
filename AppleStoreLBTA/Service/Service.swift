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
    
    
    func fetchTopFreeApps(completion: @escaping (TopFreeApps?, Error?) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/tr/apps/top-free/50/apps.json"
        
            fetchGroups(urlString: urlString, completion: completion)
    }
    
    func fetchTopPodcasts(completion: @escaping (TopFreeApps?, Error?) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/tr/podcasts/top/50/podcasts.json"
        
            fetchGroups(urlString: urlString, completion: completion)
    }
    
    
    func fetchTopMusics(completion: @escaping (TopFreeApps?, Error?) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/tr/music/most-played/50/albums.json"
        
            fetchGroups(urlString: urlString, completion: completion)
    }

    
    
    
    func fetchGroups(urlString: String, completion: @escaping (TopFreeApps?, Error?) -> ()) {
        
        guard let url = URL(string: urlString) else {return}
        
            URLSession.shared.dataTask(with: url) { data, res, err in
                
                if let err = err {
                    print("Failed to get top free apps", err)
                    completion(nil, err)
                    return
                }
                
                guard let data = data else {return}
//                print(data)
//                print(String(data: data, encoding: .utf8))

                do {
                    
                    let topFreeApps = try JSONDecoder().decode(TopFreeApps.self, from: data)
//                    topFreeApps.feed.results.forEach{print($0.name, "|", $0.artistName)}
                    completion(topFreeApps, nil)

                } catch let err {
                    print("Failed to get top free apps", err)
                    completion(nil, err)
                }
            }.resume()
        
    }
}
