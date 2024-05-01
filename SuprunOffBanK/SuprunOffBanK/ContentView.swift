//
//  ContentView.swift
//  SuprunOffBanK
//
//  Created by MacBookPro on 29.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowCards = false
    @State private var isPopolnit = false
    @State private var isTransfer = false
    @State private var cardOne = Card(balance: 100000, number: "**0001")
    @State var cardView = CreditCardView(card: Card(balance: 350000, number: "**0001"))
    @State private var cardTwo = Card(balance: 1000, number: "**0002")
    @State private var cardThre = Card(balance: 50000, number: "**0003")
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    HStack {
                        createCards()
                        Spacer()
                    }.padding()
                    Spacer()
                }
                Rectangle().fill(Color(red: 225 / 255, green: 233 / 255, blue: 222 / 255)).offset(x: isShowCards ? 176 : 0).animation(.spring(), value: isShowCards)
                VStack(alignment: .leading, spacing: 30) {
                    Text("Карта1").padding([.top], 40)
                        .font(.custom("VerdanaBold", size: 20))
                        cardView
                    HStack(alignment: .top, spacing: 30) {
                        createButton(iamgeName: "send", title: "Пополнить") {
                            isPopolnit.toggle()
                            cardView.card.add(sum: 1000)
                        }.alert(isPresented: $isPopolnit) {
                            Alert(title: Text("Карта пополнена на 1000р"))
                        }
                        createButton(iamgeName: "transfer", title: "Перевести") {
                            isTransfer.toggle()
                        }.alert(isPresented: $isTransfer) {
                            Alert(title: Text("Перевеси 1000р на карта1?"), primaryButton: .cancel(Text("Отмена")), secondaryButton: .destructive(Text("Ок"), action: {
                                cardView.card.transfer(sum: 1000, to: &cardTwo)
                                print(cardTwo.balance)
                            }))
        
                        }
                        createButton(iamgeName: "addCard", title: "Открыть\nкарту") {
                        }
                    }.frame(maxWidth: 358, maxHeight: 88)
                    .background(Color.white)
                    Spacer()
                }.offset(x: isShowCards ? 176 : 0).animation(.spring(), value: isShowCards)
            }
        }.padding([.bottom])
        Toggle(isOn:  $isShowCards) {
            Text("Показать карту").font(.custom("Verdana", size: 20))
        }.padding([.trailing], 36).padding(.leading)
    }
    
    private func createButton(iamgeName: String, title: String, action: @escaping () -> ()) -> some View {
        Button {
            action()
        } label: {
            VStack(spacing: 10) {
                Image(iamgeName)
                Text(title)
                    .lineLimit(2)
                    .font(.custom("Verdana", size: 14))
            }
        }.foregroundColor(.black)
    }
    
    private func createCards() -> some View {
        let cards = [cardOne, cardTwo, cardThre]
        return VStack {
            ForEach(0..<cards.count) { index in
                Button {
                    cardView.card = cards[index]
                } label: {
                    HStack {
                        Image("cardLogo")
                        VStack {
                            Text("\(cards[index].balance)")
                                .font(.custom("VerdanaBold", size: 18))
                            HStack {
                                Text("MIR")
                                Text(cards[index].number)
                            }.font(.custom("Verdana", size: 14))
                        }.foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

