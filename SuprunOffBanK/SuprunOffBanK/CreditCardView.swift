//
//  CreditCard.swift
//  SuprunOffBanK
//
//  Created by MacBookPro on 30.04.2024.
//

import SwiftUI

struct CreditCardView: View {
    
    private enum Constants {
        static let available = "Доступно"
    }
    
    var card: Card
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(card.balance) Р")
                .font(.custom("VerdanaBold", size: 20))
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: 290, maxHeight: .infinity, alignment: .leading)
                .frame(width: 290, height: 30)
            Text(Constants.available)
                .font(.custom("Verdana", size: 16))
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: 290, maxHeight: .infinity, alignment: .leading)
                .frame(width: 290, height: 30)
            Spacer(minLength: 68)
            Image("logoMir")
                .padding([.leading], 410)
                .frame(width: 100, height: 42)
        }.padding()
        .frame(width: 360, height: 200)
        .background(Color(red: 70 / 255, green: 183 / 255, blue: 27 / 255))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    init(card: Card) {
        self.card = card
    }
}

