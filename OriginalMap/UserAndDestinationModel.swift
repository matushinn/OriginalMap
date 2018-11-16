//
//  UserAndDestinationModel.swift
//  OriginalMap
//
//  Created by 大江祥太郎 on 2018/11/16.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class UserAndDestinationModel{
    
    var region:MKCoordinateRegion!
    
    // 地図の表示範囲を計算
    func showUserAndDestinationOnMap(userLatitude:CLLocationDegrees!,userLongitude:CLLocationDegrees!,annotation:MKPointAnnotation!,mapView:MKMapView!) {
        
        // 現在地と目的地を含む矩形を計算
        /*長押しで立てたピンの緯度経度ではなく検索で立てたピンの緯度経度を入れる*/
        
        let maxLat:Double = fmax(userLatitude, (annotation?.coordinate.latitude)! )
        let maxLon:Double = fmax(userLongitude, (annotation?.coordinate.longitude)! )
        let minLat:Double = fmin(userLatitude,  (annotation?.coordinate.latitude)! )
        let minLon:Double = fmin(userLongitude, (annotation?.coordinate.longitude)! )
        
        // 地図表示するときの緯度、経度の幅を計算
        let mapMargin:Double = 1.5;  // 経路が入る幅(1.0)＋余白(0.5)
        let leastCoordSpan:Double = 0.005;    // 拡大表示したときの最大値
        let span_x:Double = fmax(leastCoordSpan, fabs(maxLat - minLat) * mapMargin)
        let span_y:Double = fmax(leastCoordSpan, fabs(maxLon - minLon) * mapMargin)
        
        let span:MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: span_x, longitudeDelta: span_y)
        
        // 現在地と目的地の中心を計算
        let center:CLLocationCoordinate2D = CLLocationCoordinate2DMake((maxLat + minLat) / 2, (maxLon + minLon) / 2)
        return region = MKCoordinateRegion.init(center: center, span: span)
        
    }
    
    
}
