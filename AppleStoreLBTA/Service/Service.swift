//
//  Service.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 29.12.2023.
//

import Foundation


class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        

            let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)


        }
    
    
    func fetchTopFreeApps(completion: @escaping (TopFreeApps?, Error?) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/tr/apps/top-free/50/apps.json"
        
            fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopPaidApps(completion: @escaping (TopFreeApps?, Error?) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/tr/apps/top-paid/50/apps.json"
        
            fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    

    func fetchTopBooks(completion: @escaping (TopFreeApps?, Error?) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/tr/books/top-free/50/books.json"
        
            fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopPodcasts(completion: @escaping (TopFreeApps?, Error?) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/tr/podcasts/top/50/podcasts.json"
        
            fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    
    func fetchTopMusics(completion: @escaping (TopFreeApps?, Error?) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/tr/music/most-played/50/albums.json"
        
            fetchGenericJSONData(urlString: urlString, completion: completion)
    }

    

    
    func fetchHeaderResults(completion: @escaping ([HeaderModel]?, Error?) -> ()) {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
    }
    
    
    
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, err in
            
            if let err = err {
                print("Failed to get data", err)
                completion(nil, err)
                return
            }
            
            guard let data = data else {return}
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(object, nil)
                
            } catch let err {
                
                print("Failed to decode objects", err)
                completion(nil, err)
                return
            }
            
        }.resume()
        
    }
}
