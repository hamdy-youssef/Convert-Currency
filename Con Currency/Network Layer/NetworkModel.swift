//
//  NetworkModel.swift
//  NetWorkLayer
//
//  Created by Hamdy Youssef on 20/08/2023.
//

import Foundation
import UIKit

class NetworkModel {
    //completion: @escaping (_ error: Error?, _ mediaArr: [Date]?) -> Void
    var session = URLSession(configuration: URLSessionConfiguration.default)
        static func getDataForConvert(tail: String, completion: @escaping (_ error: Error?, _ currencyData: String?) -> Void){
            do{
                var baseUrl = URLs.currency
                baseUrl = baseUrl + tail
                let url = URL(string: baseUrl)!
                let request = URLRequest(url: url)
                let session = URLSession(configuration: URLSessionConfiguration.default)
                let task = session.dataTask(with: request) {data, session, error in
                    guard error == nil else {
                        completion (error!, nil)
                        return
                    }
                    guard let data = data else {
                        completion (error, nil)
                        return
                    }
                     do{
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, String>
                        var dataOfCurrency = CurrencyData()
                        dataOfCurrency.conversionValue = json["conversionValue"] as! String
                        let valueOfCurrencyAfterConvert: String = dataOfCurrency.conversionValue!
                        completion (nil, valueOfCurrencyAfterConvert)
        
                    }catch{
                        completion (error, nil)
                    }
                }
                task.resume()
            }catch{
                completion (error, nil)
            }
            
        }
    
    static func getDataForCompare(tail: String, completion: @escaping (_ error: Error?, _ valueOne: String?, _ valueTwo: String?) -> Void){
        var baseUrl = URLs.currency
        baseUrl = baseUrl + tail
        let url = URL(string: baseUrl)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) {data, session, error in
            guard error == nil else {
                completion (error!, nil, nil)
                return
            }
            guard let data = data else {
                return
            }

            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, String>
                var dataOfCurrency = CurrencyData()
                dataOfCurrency.coversionValueOne = json["firstConversionValue"] as! String
                dataOfCurrency.coversionValueTwo = json["secondConversionValue"] as! String
                let coversionValueOne: String = dataOfCurrency.coversionValueOne!
                let coversionValueTwo: String = dataOfCurrency.coversionValueTwo!
                completion (nil, coversionValueOne, coversionValueTwo)

            }catch{
                completion (error, nil, nil)
            }
        }
        task.resume()
    }
    
    static func getFavouriteCurrency (tail: String, base: String, currenciesName: [String], completion: @escaping (_ error: Error?,  _ json: [FavCurrencyRate]?) -> Void) {
        
        var baseUrl = URLs.currency
        baseUrl = baseUrl + tail
        let arrayParam = currenciesName.joined(separator: ",")
        let url = URL(string: baseUrl)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        var urlComponents = URLComponents(url: url!, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = [
            URLQueryItem(name: "baseCode", value: base),
            URLQueryItem(name: "targets", value: arrayParam)
        ]
        var request = URLRequest(url: urlComponents.url!)
        guard let finalUrl = urlComponents.url else {
            fatalError("Invalid URL")
        }
        let task = session.dataTask(with: finalUrl) {data, session, error in
            guard error == nil else {
                completion (error!, nil)
                return
            }
            guard let data = data else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let mediaRes = try decoder.decode(Instruction.self, from: data)
                completion(nil, mediaRes.targets)
            }catch{
                completion (error, nil)
            }
        }
        task.resume()
    }  
}


