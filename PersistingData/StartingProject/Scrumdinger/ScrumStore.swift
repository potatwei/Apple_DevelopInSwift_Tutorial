//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Shihang Wei on 12/9/23.
//

import Foundation

//
@MainActor
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        // return the URL of a file named scrums.data.
        .appendingPathComponent("scrums.data")
    }
    
    // Reading from the file system can be slow. To keep the interface responsive,
    // you’ll write an asynchronous function to load data from the file system.
    // Making the function asynchronous lets the system efficiently prioritize
    // updating the user interface instead of sitting idle and waiting while
    // the file system reads data.
    func load() async throws {
        
        // Add generic parameters to the task.
        // The parameters tell the compiler that
        // your closure returns [DailyScrum] and can throw an Error.
        let task = Task<[DailyScrum], Error> {
            // create a local constant for the file URL.
            let fileURL = try Self.fileURL()
            // Use a guard statement to optionally load the file data.
            // Because the scrums.data file doesn’t exist when the app
            // opens for the first time, you return an empty array if
            // there’s an error reading the file.
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            // Decode the data into a local constant named dailyScrums.
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            // Return the decoded array of scrums.
            return dailyScrums
        }
        
        // Use try await to wait for the task to finish,
        // and assign the value to a constant named scrums.
        // If the JSONDecoder throws an error inside the task,
        // the error will be propagated when you try to access
        // the value property.
        let scrums = try await task.value
        // Assign the scrums to the scrums property.
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
