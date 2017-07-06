//
//  ReadFile.swift
//  FindWoowaPeople
//
//  Created by HannaJeon on 2017. 7. 5..
//  Copyright © 2017년 woowabrothers. All rights reserved.
//

import Foundation

class ReadFile {
    func readFile(filePath: String) -> String {
        var resultHex = String()
        
        let url = URL(fileURLWithPath: filePath)
        let imageData = try? Data(contentsOf: url)
        
        if let hex = imageData {
            resultHex = hex.reduce("") { $0 + String(format: "%02x", $1) }
        }
        
        return resultHex
    }
}
