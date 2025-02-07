//
//  SwiftBookAppApp.swift
//  SwiftBookApp
//
//  Created by Taketoshi Ikegai on 2025/02/07.
//

import SwiftUI

@main
struct SwiftBookAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Books", systemImage: "books.vertical.circle") {
                    ContentView()
                }
                Tab("Second", systemImage: "gear") {
                    Text("設定ページ")
                }
                Tab("写真", systemImage: "photo") {
                    Text("写真ページ")
                }
                Tab("支払い", systemImage: "wallet.bifold.fill") {
                    Text("支払いページ")
                }
                Tab("支払い", systemImage: "wallet.bifold.fill") {
                    Text("支払いページ")
                }
                Tab("支払い", systemImage: "wallet.bifold.fill") {
                    Text("支払いページ")
                }
                Tab("支払い", systemImage: "wallet.bifold.fill") {
                    Text("支払いページ")
                }
                Tab("支払い", systemImage: "wallet.bifold.fill") {
                    Text("支払いページ")
                }
            }
            
        }
    }
}
