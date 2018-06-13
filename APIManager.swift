//
//  APIManager.swift
//  AutoLayOut
//
//  Created by MDL on 6/12/18.
//  Copyright © 2018 fit. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import PromiseKit
import SwiftyJSON
import AlamofireObjectMapper

class APIManager{
    
    static let shared = APIManager()
    
    private init (){
    }
    
    func fetchAPIData(){
        let parameters: Parameters = [
            "username": ViewController.uName,
            "email":ViewController.pWord
        ]
        let API_URL =  "https://jsonplaceholder.typicode.com/users/"
        //let Url: String = API_URL+"?email="+"Karley_Dach@jasper.info"
        
        let header = [
            "Content-Type" : "text/html; charset=UTF-8"
        ]
        Alamofire.request(API_URL,
                          method: .get,
                          parameters: parameters,
                          encoding: URLEncoding(destination: .queryString),
                          headers: header)
                   .responseString { (response) in
            switch(response.result){
            case.success(let responseString):
                print(responseString)
               let json: JSON = JSON(response.result.value!)
                let userResponse = UserResponse(JSONString:"\(responseString)")
                let newObject = json.rawString(options: [])
                
                var str = json.rawString()
                var anotherObj = JSON(str!)
                
                print("Now new object print")
                print((anotherObj))//print object in debug
                
            case.failure(let error):
                print(error)
            }
        }
       
    }
    
    func fetchData(){
        let parameters: Parameters = [
            "username": "Bret",
            "email":"Sincere@april.biz"
        ]
        let API_URL =  "https://jsonplaceholder.typicode.com/users/"
        //let Url: String = API_URL+"?email="+"Karley_Dach@jasper.info"
        
        let header = [
            "Content-Type" : "text/html; charset=UTF-8"
        ]
        
        Alamofire.request(API_URL,
                          method: .get,
                          parameters: parameters,
                          encoding: URLEncoding(destination: .queryString),
                          headers: header)
                    .responseObject { (response: DataResponse<UserResponse>) in
                       
                    switch(response.result){
                    case .success:
                        let userResponse1 = response.result.value
                        let name =  userResponse1?.name
                        print(name)
                        //nil not get out put
                        
      case .failure(_):
                      print("nil")
                    }
        
        
        
    }
}
    func fecthDataFromAPI2(){
        
        let parameters: Parameters = [
            "username": "Bret",
            "email":"Sincere@april.biz"
        ]
        let API_URL =  "https://jsonplaceholder.typicode.com/users/"
        //let Url: String = API_URL+"?email="+"Karley_Dach@jasper.info"
        
        let header = [
            "Content-Type" : "text/html; charset=UTF-8"
        ]
        
        Alamofire.request(API_URL,
                          method: .get,
                          parameters: parameters,
                          encoding: URLEncoding(destination: .queryString),
                          headers: header)
            .responseJSON { response in
                print("JSON:\(response.result.value)")
               let jsonResponse = JSON(response.result.value)
                print(jsonResponse)
                
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value{
                        print("data1")
                          print(data)
                        
                       
                    }
                    
                case .failure(_):
                    
                    print("Error message:\(response.result.error)")
                    break
                    
                }
            }
            .responseString { response in
                print("String:\(response.result.value)")
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value{
                         print("data2")
                        print(data)
                    }
                    
                case .failure(_):
                    print("Error message:\(response.result.error)")
                    break
                }
        }
    }
}
