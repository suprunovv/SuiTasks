//
//  ContentView.swift
//  SuiTasks
//
//  Created by MacBookPro on 01.05.2024.
//

import SwiftUI

struct VpnTabBarView: View {
    @StateObject private var tariffData = TariffData()
    @State var select = 0
    
    var body: some View {
        TabView(selection: $select) {
            VpnView()
                .tabItem {
                    Image(systemName: "lock")
                    Text("VPN")
                }.tag(0)
            PurchaseView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("purchase")
                }.tag(1)
            BasketView()
                .tabItem {
                    Image(systemName: "basket")
                    Text("basket")
                }.tag(2)
        }.environmentObject(tariffData)
            .onAppear() {
                UITabBar.appearance().backgroundColor = UIColor.barTint
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VpnTabBarView()
    }
}


