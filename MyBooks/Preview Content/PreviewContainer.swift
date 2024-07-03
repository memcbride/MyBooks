//
//  PreviewContainer.swift
//  MyBooks
//
//  Created by Mark McBride on 7/3/24.
//

import Foundation
import SwiftData

struct Preview {
    let container: ModelContainer
    
    init(_ models: any PersistentModel.Type...) {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let schema = Schema(models)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("😡  ERROR: Could not crete preview container")
        }
    }
    
    func addExamples(_ examples: [any PersistentModel]) {
        Task { @MainActor in
            examples.forEach {example in
                container.mainContext.insert(example)
            }
        }
    }
}
