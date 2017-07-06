//
//  ReadFile.swift
//  FindWoowaPeople
//
//  Created by HannaJeon on 2017. 7. 5..
//  Copyright © 2017년 woowabrothers. All rights reserved.
//

import Foundation

class Controller {
    func readFile(filePath: String) -> String {
        var resultHex = String()
        
        let url = URL(fileURLWithPath: filePath)
        let imageData = try? Data(contentsOf: url)
        
        if let hex = imageData {
            resultHex = hex.reduce("") { $0 + String(format: "%02x", $1) }
        }
        
        return resultHex
    }
    
    func makeHtml(hexString: String) -> String {
        var result = "<div style='width: 256px;'>"
        var color = String()
        let closeDiv = "'></div>"
        
        for (i, c) in hex.characters.enumerated() {
            color += String(c)
            
            if(i+1) % 8 == 0 {
                let sliceIndex = color.index(color.startIndex, offsetBy: 6)
                color = color.substring(to: sliceIndex)
                let openDiv = "<div style='width: 1px; height: 1px; float: left; background-color:#\(color)"
                result += openDiv + closeDiv
                color = String()
            }
        }
        
        result += "</div>"
        return result
    }
    
    func writeHtml(htmlString: String) {
        let filename = "/Users/woowabrothers/local-documents/TECHCAMP/7.5_find_woowapeople/".appending("test.html")

        do {
            try htmlString.write(toFile: filename, atomically: true, encoding: .utf8)
        } catch {
            print("error")
        }
    }
}


