//
//  UIView+Frame.swift
//  XYLive
//
//  Created by xiyan on 2018/9/11.
//  Copyright © 2018年 xiyan. All rights reserved.
//

import Foundation
extension UIView {
    
    public var X : CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
            
        }
    }
    
    public var Y : CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    public var RightX : CGFloat {
        get{
            return self.X + self.Width
        }
        set{
            var rect = self.frame
            rect.origin.x = newValue - self.Width
            self.frame = rect
        }
    }
    
    public var LeftX : CGFloat {
        get{
            return self.X
        }
        set{
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    public var Top : CGFloat {
        get{
            return self.Y
        }
        set{
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    public var Bottom : CGFloat {
        get{
            return self.Y + self.Height
        }
        set{
            var rect = self.frame
            rect.origin.y = newValue - self.Height
            self.frame = rect
        }
    }
    
    public var Width : CGFloat {
        get{
            return self.frame.size.width
        }
        set{
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    public var Height : CGFloat {
        get{
            return self.frame.size.height
        }
        set{
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
    
    public var CenterX : CGFloat {
        get{
            return self.center.x
        }
        set{
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    public var CenterY : CGFloat {
        get{
            return self.center.y
        }
        set{
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    public var Origin : CGPoint {
        get{
            return self.frame.origin
        }
        set{
            var rect = self.frame
            rect.origin = newValue
            self.frame = rect
        }
    }
}
