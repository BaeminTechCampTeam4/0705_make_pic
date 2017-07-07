//
//  main.swift
//  FindWoowaPeople
//
//  Created by woowabrothers on 2017. 7. 5..
//  Copyright © 2017년 woowabrothers. All rights reserved.
//

import Foundation

// 경로는 바뀔 수 있기 때문에 더 나은 코드로 리팩토링 예정

let inputPath = readLine()

if let path = inputPath {
    let hex = Controller().readFile(filePath: inputPath!)
    let htmlString = Controller().makeHtml(hexString: hex)
    Controller().writeHtml(htmlString: htmlString, resultPath: path)
} else {
    print("경로를 정확히 입력해 주세요")
}
