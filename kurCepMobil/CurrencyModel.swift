//
//  CurrencyModel.swift
//  kurCepMobil
//
//  Created by Apple Atölyesi on 28.08.2024.
//

import Foundation
import UIKit

struct Currency {
    var changeRate:Double
    var price:Double
    let currencyIcon:UIImage
    let currencyName:String
    
}

var currencyList = [Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named:"tryicon")!, currencyName: "TRY"),
                    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named:"usdicon")!, currencyName: "USD"),
                    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named:"ukicon")!, currencyName: "EUR"),
                    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named:"manaticon")!, currencyName: "MNT"),
                    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named:"tryicon")!, currencyName: "TRY"),
                    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named:"tryicon")!, currencyName: "TRY"),
                    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named:"tryicon")!, currencyName: "TRY"),
                    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named:"tryicon")!, currencyName: "TRY"),
                    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named:"tryicon")!, currencyName: "TRY"),
                    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named:"tryicon")!, currencyName: "TRY"),
                    
                   
]
