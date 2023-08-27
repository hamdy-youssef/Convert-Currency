//
//  NetworkModel.swift
//  NetWorkLayer
//
//  Created by Hamdy Youssef on 20/08/2023.
//

import Foundation

class NetworkModel {
    //completion: @escaping (_ error: Error?, _ mediaArr: [Date]?) -> Void
    
    
        static func getDataForConvert(tail: String, completion: @escaping (_ error: Error?, _ currencyData: String?) -> Void){
            var baseUrl = URLs.currency
            baseUrl = baseUrl + tail
            let url = URL(string: baseUrl)
            let request = URLRequest(url: url!)
            let session = URLSession(configuration: URLSessionConfiguration.default)
    
            let task = session.dataTask(with: request) {data, session, error in
                print(data!)
    
                guard error == nil else {
                    print(error!)
                    completion (error!, nil)
                    return
                }
    
                guard let data = data else {
                    print(Networking.noData)
                    return
                }
    
                do{
                    print(baseUrl)
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, String>
                    var dataOfCurrency = CurrencyData()
                    dataOfCurrency.conversionValue = json["conversion_rate"] as! String
                    let valueOfCurrencyAfterConvert: String = dataOfCurrency.conversionValue
                    completion (nil, valueOfCurrencyAfterConvert)
    
                }catch{
                    print(error)
                }
            }
            task.resume()
        }
    
    static func getDataForCompare(tail: String, completion: @escaping (_ error: Error?, _ valueOne: String?, _ valueTwo: String?) -> Void){
        var baseUrl = URLs.currency
        baseUrl = baseUrl + tail
        let url = URL(string: baseUrl)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)

        let task = session.dataTask(with: request) {data, session, error in
            print(data!)

            guard error == nil else {
                print(error!)
                completion (error!, nil, nil)
                return
            }

            guard let data = data else {
                print(Networking.noData)
                return
            }

            do{
                print(baseUrl)
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, String>
                var dataOfCurrency = CurrencyData()
                dataOfCurrency.conversionValue = json["conversion_rate"] as! String
                let coversionValueOne: String = dataOfCurrency.coversionValueOne
                let coversionValueTwo: String = dataOfCurrency.coversionValueTwo
                completion (nil, coversionValueOne, coversionValueTwo)

            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    static func getFavouriteCurrency (tail: String, base: String, currenciesName: [String], completion: @escaping (_ error: Error?, _ favouriteCurrency: [CurrencyData]?) -> Void) {
        
        var baseUrl = URLs.currency
        baseUrl = baseUrl + tail
        let arrayParam = currenciesName.joined(separator: ",")
        let url = URL(string: baseUrl)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        var urlComponents = URLComponents(url: url!, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = [
            URLQueryItem(name: "base", value: base),
            URLQueryItem(name: "targets", value: arrayParam)
        ]
        guard let finalUrl = urlComponents.url else {
            fatalError("Invalid URL")
        }
        let task = URLSession.shared.dataTask(with: request) { data, session, error in
            print(finalUrl)
            print(data)
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                // print(json)
            }catch{
                print(error)
            }
        }
        print(finalUrl)
        task.resume()
    }
}


