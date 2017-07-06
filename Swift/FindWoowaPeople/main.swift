//
//  main.swift
//  FindWoowaPeople
//
//  Created by woowabrothers on 2017. 7. 5..
//  Copyright © 2017년 woowabrothers. All rights reserved.
//

import Foundation

// 경로는 바뀔 수 있기 때문에 더 나은 코드로 리팩토링 예정
let hex = Controller().readFile(filePath: "/Users/woowabrothers/local-documents/TECHCAMP/7.5_find_woowapeople/4.tech")
let htmlString = Controller().makeHtml(hexString: hex)
Controller().writeHtml(htmlString: htmlString)
