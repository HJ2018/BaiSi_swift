//
//  Global.swift
//  U17
//
//  Created by charles on 2017/10/24.
//  Copyright © 2017年 None. All rights reserved.
//

import Foundation
import UIKit



let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

var isIphoneX: Bool {
    return UI_USER_INTERFACE_IDIOM() == .phone
        && (max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 812
        || max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 896)
}

// iphone X
let isIphoneXMax = Bool(screenWidth >= 375.0 && screenHeight >= 812.0)

// 导航栏的高度
let NavBarHeight : CGFloat = isIphoneXMax ? 88 : 64

// 底部 tabBar 的高度
let TabBarHeight : CGFloat = isIphoneXMax ? 49 + 34 : 49

/** 状态栏的高度 */
let StatusBarHeight = CGFloat(isIphoneXMax ? 44 : 20)
/** 底部的安全距离 */
let BottomSafeHeight = CGFloat(isIphoneXMax ? 34 : 0)
/** 顶部的安全距离 */
let TopSafeHeight = CGFloat(isIphoneXMax ? 44 : 0)


var topVC: UIViewController? {
    var resultVC: UIViewController?
    resultVC = _topVC(getWindod!.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    return resultVC
}

var getWindod : UIWindow? {
    return UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
}

private  func _topVC(_ vc: UIViewController?) -> UIViewController? {
    if vc is UINavigationController {
        return _topVC((vc as? UINavigationController)?.topViewController)
    } else if vc is UITabBarController {
        return _topVC((vc as? UITabBarController)?.selectedViewController)
    } else {
        return vc
    }
}

//MARK: print
func BLog<T>(_ message: T, file: String = #file, function: String = #function, lineNumber: Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):funciton:\(function):line:\(lineNumber)]- \(message)")
    #endif
}

//文字高度
func textHeight(text : String , fontSize : CGFloat , width : CGFloat) -> CGFloat{
    
    return text.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: fontSize)], context: nil).size.height + 5.0
}


