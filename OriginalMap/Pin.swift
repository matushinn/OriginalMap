//
//  Pin.swift
//  OriginalMap
//
//  Created by 大江祥太郎 on 2018/11/16.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import MapKit

class Pin: NSObject, MKAnnotation {
    // 位置情報
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    // 追加時の入力テキスト
    var title: String?
    
    // 位置情報とテキストを格納した状態のオブジェクトを返します
    init(geo:CLLocationCoordinate2D, text: String?){
        coordinate = geo
        title = text
    }
    // 保持中の値をUserDefaultsに登録できるように変換
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]
        
        dict["latitude"] = coordinate.latitude
        dict["longitude"] = coordinate.longitude
        
        if let tit = title {
            dict["title"] = tit
        }
        
        return dict
    }
    // UserDefaultsから取り出した各値を変換したオブジェクトを返します
    init(dictionary: [String: Any]) {
        if let latitude = dictionary["latitude"] as? Double, let longitude = dictionary["longitude"] as? Double {
            coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        
        if let tit = dictionary["title"] as? String {
            title = tit
        }
    }
    
}
