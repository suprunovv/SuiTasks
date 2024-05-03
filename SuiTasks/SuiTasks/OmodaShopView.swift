//
//  ContentView.swift
//  SuiTasks
//
//  Created by MacBookPro on 01.05.2024.
//

import SwiftUI
import UIKit

struct OmodaShopView: View {

    @State var isOnToggle = false
    @State var showAlert = false
    @State var isSharePresented = false
    @State var sowAlertMessage = false 
        
    private enum Constants {
        static let kaskoTitle = "ОМОДА Каско"
        static let optionTitle = "Комплектация"
        static let title = "Информация об Автомобиле"
        static let engine = "Двигатель"
        static let engineValue = "1.6 Turbo"
        static let driveUnit = "Привод"
        static let awd = "AWD"
        static let priceTitle = "Цена"
        static let buttonTitle = "Заказать"
        static let alertKaskoTitle = "ОМОДА Каско"
        static let kaskoMessage = "Подключить Каско на выгодных условиях?"
        static let message = "Благодарим за заказ. Наш менеджер свяжется с Вами в рабочее время для уточнения деталей."
    }
    
    @ObservedObject private var viewModel = OmodaShopViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(maxWidth: .infinity)
                Image.omodaTitle.padding(.leading)
                Spacer().frame(width: .infinity)
                Button {
                    isSharePresented.toggle()
                } label: {
                    Image.share
                }.sheet(isPresented: $isSharePresented) {
                    ActivityView(activityItems: [viewModel.currentCar.photo])
                }
            }.padding([.leading, .trailing])
            Spacer().frame(height: 22)
            Image(viewModel.currentCar.photo)
                .resizable()
                .frame(maxWidth: 345, maxHeight: 190)
            Spacer().frame(height: 37)
            Picker(selection: Binding(get: {
                viewModel.segmentIndex
            }, set: { newValue in
                viewModel.segmentIndex = newValue
            }), label: Text("")) {
                ForEach(viewModel.omodaCars.indices, id: \.self) {
                    Text(viewModel.omodaCars[$0].model)
                }
            }
            .background(.white)
            .tint(.white)
            .frame(maxWidth: 345)
            .font(.headline)
            .pickerStyle(SegmentedPickerStyle())
            .clipShape(RoundedRectangle(cornerRadius: 8))
            Spacer().frame(height: 32)
            informationBody
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
        .padding(.all, 0)
        .background(Color.gray)
    }
    
    private var kaskoBody: some View {
        HStack {
            Text(Constants.kaskoTitle)
            Toggle.init(isOn: Binding(get: {
                isOnToggle
            }, set: { newValue in
                isOnToggle = newValue
                showAlert = isOnToggle ? true : false
                if !isOnToggle {
                    viewModel.kasko = false 
                }
            })) {
               
            }.alert(Constants.alertKaskoTitle, isPresented: $showAlert, actions: {
                Button("Нет, не нужно") {
                    isOnToggle = false
                    viewModel.kasko = false
                }
                Button("Да") {
                    viewModel.kasko = true
                }
            }) {
                Text(Constants.kaskoMessage)
            }
        }.padding([.leading, .trailing, .top])
    }
    
    private var optionBody: some View {
        VStack {
            HStack {
                Text(Constants.optionTitle)
                Spacer()
            }.padding(.leading)
            Slider(value: Binding(get: {
                viewModel.optionIndex
            }, set: { newValue in
                viewModel.optionIndex = newValue
            }), in: 0...4, step: 1).frame(maxWidth: 358)
                .tint(.black)
                .onAppear {
                    UISlider.appearance().setThumbImage(UIImage(named: "tumb"), for: .normal)
                }.frame(height: 8)
            createOptionsView(options: viewModel.options)
            kaskoBody
        }
    }
    
    private var informationBody: some View {
        VStack {
            Spacer().frame(height: 25)
            Text(Constants.title).font(.system(size: 18, weight: .bold))
            Spacer().frame(height: 20)
            VStack(alignment: .center) {
                createCharacters(title: Constants.engine,
                                 char: Constants.engineValue )
                Divider().frame(maxWidth: 270)
                createCharacters(title: Constants.driveUnit, char: Constants.awd)
                Divider().frame(maxWidth: 270)
            }
            optionBody
            HStack {
                Text(Constants.priceTitle)
                Spacer()
                Text("\(viewModel.totalPrice)")
            }.padding()
                .font(.system(size: 18, weight: .bold))
            Button(Constants.buttonTitle) {
                sowAlertMessage.toggle()
            }.confirmationDialog("", isPresented: $sowAlertMessage, actions: {
            }, message: {
                Text(Constants.message)
            })
            .frame(maxWidth: 358, maxHeight: 48)
            .background(Color.black)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .font(.system(size: 18, weight: .bold))
            Spacer()
        }.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
    
    func createCharacters(title: String, char: String) -> some View {
      return HStack {
            Text(title)
            Spacer()
            Text(char)
        }.padding([.leading, .trailing])
    }
    
    func createOptionsView(options: [String]) -> some View {
        return HStack(spacing: 1) {
            ForEach(options.indices, id: \.self) {
                Text(options[$0]).frame(maxWidth: 60)
                    .font(.system(size: 12))
                    .lineLimit(1)
            }.padding([.leading, .trailing], 10)
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OmodaShopView()
    }
}
