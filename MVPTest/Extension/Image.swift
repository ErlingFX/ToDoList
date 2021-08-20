//
//  Image.swift
//  MVPTest
//
//  Created by Александр Назаров on 18.08.2021.
//

import UIKit

extension UIImage {
    
    func saveImage() -> String? {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let docURL = URL(string: documentsDirectory)!
        let dataPath = docURL.appendingPathComponent("imageDirectory")
        if !FileManager.default.fileExists(atPath: dataPath.path) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        guard let data = self.jpegData(compressionQuality: 1) ?? self.pngData() else {
            return nil
        }
        
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL,
              
              let newFolderUrlImage = directory.appendingPathComponent("imageDirectory")
        else {
            return nil
        }
        
        let pathToImage = newFolderUrlImage.appendingPathComponent("\(Date().timeIntervalSince1970).png")
        
        do {
            try data.write(to: pathToImage)
            return pathToImage.path
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

//let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//let documentsDirectory = paths[0]
//let docURL = URL(string: documentsDirectory)!
//let dataPath = docURL.appendingPathComponent("MyFolder")
//if !FileManager.default.fileExists(atPath: dataPath.path) {
//    do {
//        try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
//    } catch {
//        print(error.localizedDescription)
//    }
//}
