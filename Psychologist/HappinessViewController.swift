
import UIKit

class HappinessViewController: UIViewController,FaceViewDataSource {

    @IBOutlet weak var faceView: FaceView!{
        didSet{
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
   // happiness is assumed to be a "little" Model
   var happiness:Int = 75{// 0 = very sad  and 100 = ecstatic
        didSet{
            happiness = min(max(happiness,0),100)
            println("Happines: \(happiness)")
            title = "\(happiness)"
            updateUI()
        }
    }
    private struct Constants{
        static let HappinessGestureScale:CGFloat = 4
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state{
        case .Ended:fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let HappinesChange = -Int(translation.y / Constants.HappinessGestureScale)
            if HappinesChange != 0{
                happiness += HappinesChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    private func updateUI(){
        faceView?.setNeedsDisplay()
    }
    
    func similinessForFaceView(sender: FaceView)-> Double?{
        return Double(happiness - 50) / 50
    }
    
}
