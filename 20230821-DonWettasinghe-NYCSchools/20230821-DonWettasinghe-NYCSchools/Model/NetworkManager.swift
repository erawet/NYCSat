//
//  NetworkManager.swift
//  20230722-DonWettasinghe-NYCSchools
//
//  Created by Don Wettasinghe on 8/21/23.
//

import Foundation

struct APIURLConstants {
    static let fetchSchools = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    static let fetchSATScores = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
}

class NetworkManager{
    let token = ""

    
    func fetchData(urlString: String, completionHandler: @escaping (Any?, Error?) -> ()) -> (){
        
        guard let urlPath = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else { return }
        
        guard let url = URL(string: urlPath) else {
            print("Error: cannot create URL")
            completionHandler(["Error"], nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (responseData, response
            , error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 403 {
                    print("Error: Access Denied.")
                    completionHandler(["Error"], error)
                }
            }
            
            if error != nil {
                print("Error: Received Error.")
                completionHandler(["Error"], error)
                return
            }
            
            guard responseData != nil else {
                print("Error: did not receive data")
                completionHandler(["Error"], error)
                return
            }
            
            completionHandler(responseData, error)
        }
        task.resume()
    }
}
