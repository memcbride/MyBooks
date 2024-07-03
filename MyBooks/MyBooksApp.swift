//
//  MyBooksApp.swift
//  MyBooks
//
//  Created by Mark McBride on 7/1/24.
//

import SwiftUI
import SwiftData

@main
struct MyBooksApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(container)
//        .modelContainer(for: Book.self)
    }
    
    init () {
        let schema = Schema([Book.self])
        let config = ModelConfiguration("MyBooks",schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("😡 ERROR: Could not configure container")
        }
//        let config = ModelConfiguration(url: URL.documentsDirectory.appending(path: "MyBooks.store"))
//        do {
//            container = try ModelContainer(for: Book.self, configurations: config)
//        } catch {
//            fatalError("😡 ERROR: Could not configure container")
//        }
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
//        print(URL.documentsDirectory.path())
    }
}
