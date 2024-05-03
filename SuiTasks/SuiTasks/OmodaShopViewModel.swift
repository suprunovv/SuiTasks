//
//  OmodaShopViewModel.swift
//  SuiTasks
//
//  Created by MacBookPro on 02.05.2024.
//

import Foundation
/// ВьюМодель для магазина машин
final class OmodaShopViewModel: ObservableObject {
    @Published var segmentIndex = 0
    @Published var optionIndex: Float = 0
    var kasko = false
    let options = ["Joy", "Lifestyle", "Ultimate", "Active", "Supreme"]
    var omodaCars = [Car(model: "C5", price: 1200000, photo: "omodaC5"),
                     Car(model: "S5", price: 1999000, photo: "omodaS5"),
                     Car(model: "S5-GT", price: 2399999, photo: "omodaS5GT")]
    
    var totalPrice: Int {
        var price = omodaCars[segmentIndex].price
        for _ in 0..<Int(optionIndex) {
            price += 190000
        }
        let kaskoPrice = kasko ?  99000 : 0
        price += kaskoPrice
        return price
    }
    
    var currentCar: Car {
        omodaCars[segmentIndex]
    }
}
