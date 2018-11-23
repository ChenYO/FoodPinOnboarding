//
//  WebViewController.swift
//  FoodPin
//
//  Created by 陳仲堯 on 2018/9/20.
//  Copyright © 2018年 AppCoda. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var targetURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        if let url = URL(string: targetURL) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
//        let bgImage: UIImageView = UIImageView.init(frame: CGRect(x: 30, y: 30, width: webView.frame.size.width, height: CGFloat(60)))
//
//        bgImage.image = textToImage(drawText: "測試", inImage: UIImage(named:"white.png")!, atPoint: CGPoint(x: 0, y: 80))
//
//        bgImage.alpha = 0.3
        
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        bgView.isUserInteractionEnabled = false
        bgView.alpha = 0.05
      
        for x_index in 1...20 {
            for y_index in 1...10 {
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
                label.center = CGPoint(x: 50 * y_index, y: 50 * x_index)
                label.textAlignment = NSTextAlignment.center
                label.text = "Hello"
                label.textColor = UIColor.black
                bgView.addSubview(label)
            }
        }
       
        self.view.addSubview(bgView)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textToImage(drawText text: String , inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.black
        let textFont = UIFont(name: "Helvetica Bold", size: 20)!
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedStringKey.font: textFont,
            NSAttributedStringKey.foregroundColor: textColor,
        ] as [NSAttributedStringKey: Any]
        
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// 在圖片上加上浮水印
extension UIImage {
    enum WaterMarkCorner {
        case TopLeft
        case TopRight
        case BottomLeft
        case BottomRight
    }
    
    func waterMarkedImage(waterMarkImage: UIImage, corner: WaterMarkCorner = .BottomRight, margin: CGPoint = CGPoint(x: 20, y: 20), alpha: CGFloat = 1) -> UIImage {
        var markFrame = CGRect(x: 0, y: 0, width: waterMarkImage.size.width, height: waterMarkImage.size.height)
        let imageSize = self.size
        
        switch corner {
        case .TopLeft:
            markFrame.origin = margin
        case .TopRight:
            markFrame.origin = CGPoint(x: imageSize.width - waterMarkImage.size.width - margin.x, y: margin.y)
        case .BottomLeft:
            markFrame.origin = CGPoint(x: margin.x, y: imageSize.height - waterMarkImage.size.height - margin.y)
        case .BottomRight:
            markFrame.origin = CGPoint(x: imageSize.width - waterMarkImage.size.width - margin.x, y: imageSize.height - waterMarkImage.size.height - margin.y)
        }
        
        UIGraphicsBeginImageContext(imageSize)
        self.draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        waterMarkImage.draw(in: markFrame, blendMode: .normal, alpha: alpha)
        let waterMarkedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return waterMarkedImage!
    }
}
