//
//  HomeViewController.swift
//  kurCepMobil
//
//  Created by Apple Atölyesi on 28.08.2024.
//

import Foundation
import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let CORE_URL:String = "https://data.fixer.io/api"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewControler")
        tableView.dataSource = self
        tableView.delegate = self
        
        let parameters = ["access_key":"899aa13826e22a58c63498773455ec8f"]
        var urlComponents = URLComponents(string: CORE_URL + "/latest")!
        
        urlComponents.queryItems = parameters.map{URLQueryItem(name: $0.key,value: $0.value)}
        
        guard let url = urlComponents.url else {
            print("invalid url")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data,response,error in
            
            if let error = error {
                print(error)
            }
            guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200 else{
                print("ınvalid responce code")
                return
            }
            
            if let data = data {
                if let dataString = String(data: data, encoding: .utf8){
                    print("Data is in String: \(dataString)")
                }
                do {
                    var JsonDecoder = JSONDecoder()
                    let response:Response = try
                    JsonDecoder.decode(Response.self, from: data)
                    print("IS RESPONSE SUCCESS? " + String(response.success))
                    currencyResponseList.removeAll()
                    for currenceTemp in response.rates {
                        print("responses: " + currenceTemp.key)
                        var element:CurrencyResponse = CurrencyResponse(currencyName: currenceTemp.key, value: currenceTemp.value)
                        
                        currencyResponseList.append(element)
                        
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let errorInparsing {
                    print("Error IN parsing." + errorInparsing.localizedDescription)
                }
            }
            
        }
        task.resume()
    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
             let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
            
            cell.iconLabel.text =
            currencyResponseList[indexPath.row].currencyName
                    cell.fromLabel.text = currencyResponseList[indexPath.row].currencyName
                    cell.toLabel.text = "EUR"
            
                    cell.priceLabel.text = String(currencyResponseList[indexPath.row].value)
                    
            var formattedDouble = String(format: "%.2f",
                                                 currencyResponseList[indexPath.row].value)
            cell.priceLabel.text = String(formattedDouble)
            
            return cell
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return currencyResponseList.count
        }
     
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            40
        }
        

    }

