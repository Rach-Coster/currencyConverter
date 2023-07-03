import UIKit

@IBDesignable
class SemiCircleView: UIView {

    private var arcShape: CAShapeLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        if arcShape == nil {
            arcShape = CAShapeLayer()
            layer.addSublayer(arcShape)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Getting the colour of the line so that it can be assigned to the arc
        let rect = superview!.subviews.first(where: {$0 is UIImageView}) as! UIImageView
        
        
        let startAngle: CGFloat = .pi / 6
        let endAngle: CGFloat = .pi *  7 / 6
        
        let center = CGPoint(x: bounds.midX, y: bounds.maxY)
        let radius = bounds.width * 0.3
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        arcShape.path = path.cgPath
        arcShape.fillColor = UIColor.black.cgColor
        arcShape.strokeColor = rect.tintColor.cgColor
        arcShape.lineWidth = 4.0
        
        print("Color \(arcShape.strokeColor?.components)")
    
        let rotationAngle: CGFloat = -CGFloat.pi / 6  // -45 degrees (-π/4 radians)
        let rotationTransform = CATransform3DMakeRotation(rotationAngle, 0, 0, 1)
        arcShape.transform = rotationTransform
        
        let scaleFactor: CGFloat = 1.75 // Adjust the scale factor as desired
        let scalingTransform = CATransform3DMakeScale(scaleFactor, scaleFactor, 1)
        arcShape.transform = CATransform3DConcat(arcShape.transform, scalingTransform)
        
        arcShape.lineWidth = (4.0 / scaleFactor)
    }

}

