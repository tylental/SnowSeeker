//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-19.
//

import Foundation

extension Bundle {
    
    // creating this extension on decode so it can work with any type that calls it
    
    // i.e. our Resort type calling this so that it can return a value that is of Resort type
    // can only be used with types that are decodable
    
    func decode<T: Decodable>(_ file: String) -> T {
        
        // getting our URL
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in the bundle.")
        }
        
        // setting our data from our URL
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        do {
            // return a decoded value from the data as the type of the caller
            return try decoder.decode(T.self, from: data)
            
            // handle all types of errors depending on the scenario
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) due to missing key '\(key)' - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context){
            fatalError("Failed to decode \(file) due to type mismatch - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
         
    }
}
