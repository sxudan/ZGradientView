//
//  ZGradientView.swift
//  Pods-ZGradientView_Example
//
//  Created by sudayn on 12/28/20.
//

import UIKit

@IBDesignable
public class ZGradientView: UIView {
    
    @IBInspectable public var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable public var centerColor:  UIColor = .clear { didSet { updateColors() }}
    @IBInspectable public var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable public var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable public var centerLocation: Double = 0.45 {didSet { updateLocations() }}
    @IBInspectable public var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable public var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable public var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    public var colors: [CGColor]? { didSet { updateColors() }}
    public var locations: [NSNumber]? {didSet { updateLocations() }}
    
    override public class var layerClass: AnyClass { CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        var pairLocations: [NSNumber]!
        if centerColor == UIColor.clear {
            pairLocations = [startLocation as NSNumber, endLocation as NSNumber]
        } else {
            pairLocations = [startLocation as NSNumber, centerLocation as NSNumber, endLocation as NSNumber]
        }
        gradientLayer.locations = locations ?? pairLocations
    }
    func updateColors() {
        var pairColors: [CGColor]!
        if centerColor == UIColor.clear {
            pairColors = [startColor.cgColor, endColor.cgColor]
        } else {
            pairColors = [startColor.cgColor, centerColor.cgColor, endColor.cgColor]
        }
        gradientLayer.colors = colors ?? pairColors
    }
    
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updatePoints()
        updateLocations()
        updateColors()
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            } else {
                fatalError("The hex string must be 8 letters long (# Red Green Blue Alpha).")
            }
        }

        return nil
    }
}
