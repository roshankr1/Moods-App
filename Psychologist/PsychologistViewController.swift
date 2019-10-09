
import UIKit

class PsychologistViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
    var history = ""
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        
        if let navCon = destination as? UINavigationController{
            destination = navCon.visibleViewController
        }
        
        if let hvc = destination as? HappinessViewController{
            if let identifier = segue.identifier{
                switch identifier{
                    case "sad":
                        hvc.happiness = 0
                        history += "\nsad"
                    case "happy":
                        hvc.happiness = 100
                        history += "\nhappy"
                    case "nothing":
                        hvc.happiness = 25
                        history += "\nnothing"
                    default:
                        hvc.happiness = 50
                        if identifier == "meh"{
                            history += "\nmeh"
                    }
                }
                
            }
        }
    }
}
