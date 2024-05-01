//
//  ContentView.swift
//  SettingsApp
//
//  Created by MacBookPro on 30.04.2024.
// Что такое Form, для чего нужен Section, чем структура отличается от класса? Могут ли структуры наследоватся? Можно ли использовать превью в UIkit или это только в Sui? 

import SwiftUI

struct ContentView: View {
    
    @State private var apIdSettings = 0
    @State private var wifis = 0
    @State private var offers = 0
    @State private var bluetuth = 0
    @State private var nets = 0
    @State private var modems = 0
    @State private var isFly = false
    @State private var isVpn = false
    private let apSattings = [""]
    private let wifiSetings = ["Подключено", "Не подключено"]
    private let bluetuthSetings = ["Вкл", "Выкл"]
    private let modemSettings = ["Вкл", "Выкл"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack(spacing: 10) {
                        Image("catAva1")
                            .frame(width: 80, height: 80)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Anton").font(.system(size: 22))
                            Text("Apple ID, iCloud, контент и покупки").font(.system(size: 12))
                        }
                        Spacer()
                        Picker("", selection: $apIdSettings) {
                            ForEach(0..<apSattings.count) {
                                Text(apSattings[$0])
                            }
                        }.frame(maxWidth: 20)
                            .pickerStyle(.navigationLink)
                    }
                    HStack {
                        Text("Предложения Apple ID")
                        Spacer(minLength: 35)
                        createCircle(num: 2)
                        Picker("", selection: $offers) {
                            Text("")
                        }.frame(maxWidth: 20)
                            .pickerStyle(.navigationLink)
                    }
                }
                Section {
                    HStack {
                        Text("IOS 17.2: уже доступно")
                        Spacer(minLength: 35)
                        createCircle(num: 3)
                        Picker("", selection: $offers) {
                            Text("")
                        }.frame(maxWidth: 20)
                            .pickerStyle(.navigationLink)
                    }
                }
                Section {
                    createFormSetting(imageName: "fly", color: .orange, $wifis, array: [""], title: "Aвиарежим", type: .toSwitch, state: $isFly)
                    createFormSetting(imageName: "wifi", color: .blue, $wifis, array: wifiSetings, title: "Wi-Fi", type: .toPicker, state: $isFly)
                    createFormSetting(imageName: "bluetuth", color: .blue, $bluetuth, array: bluetuthSetings, title: "Bluetooth", type: .toPicker, state: $isFly)
                    createFormSetting(imageName: "nets", color: .green, $nets, array: [""], title: "Сотовая связь", type: .toPicker, state: $isFly)
                    createFormSetting(imageName: "chain", color: .green, $modems, array: modemSettings, title: "Режим модема", type: .toPicker, state: $isFly)
                    createFormSetting(imageName: "net", color: .blue, $nets, array: [""], title: "VPN", type: .toSwitch, state: $isVpn)
                }
            }.navigationTitle(Text("Насторйки"))
        }
    }
    
    private func createCircle(num: Int) -> some View {
        ZStack {
            Circle()
                .foregroundColor(.red)
                .frame(width: 25, height: 25)
            Text("\(num)")
                .foregroundColor(.white)
        }
    }
    
    private func createFormSetting(imageName: String, color: Color, _ selection: Binding<Int>, array: [String], title: String, type: RowType, state: Binding<Bool>) -> some View {
        return HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(color)
                    .frame(width: 30, height: 30)
                Image(imageName)
            }
            Text(title).font(.system(size: 14))
            Spacer(minLength: 35)
            switch type {
            case .toPicker:
                Picker("", selection: selection) {
                    ForEach(0..<array.count) {
                        Text(array[$0])
                    }
                }.frame(maxWidth: 205, maxHeight: 35)
                    .pickerStyle(.automatic)
            case .toSwitch:
                Toggle(isOn: state) {
                    Text("")
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
