import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var phrasePicker: UIPickerView!
    @IBOutlet var intervalPicker: UIPickerView!
    
    var phrases: [String]!
    var intervals: [String]!
    
    var selectedInterval: Int = 1
    
    var shouldLoop: Bool = false
    var isTest: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        phrases = ["I have an iPad","I am important","I have many leather bound books","My apartment smells of rich mahogany","You smell different today"]
        intervals = ["1 s", "5 s", "30 s", "1 min", "5 min", "10 min", "30 min", "8 hrs", "24 hrs"]
        
        phrasePicker.dataSource = self
        phrasePicker.delegate = self
        
        intervalPicker.dataSource = self
        intervalPicker.delegate = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == phrasePicker {
            return phrases.count
        }else{
            return intervals.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if pickerView == phrasePicker {
            return phrases[row]
        }else{
            return intervals[row]
        }
    }
    
//    func loopPhrase(){
//        playPhrase()
//        
//        if shouldLoop {
//            delay(intervalFromPicker(), closure: {
//                
//            })
//        }
//    }
//    
//    func intervalFromPicker() -> Int {
//        switch intervals[intervalPicker.selectedRowInComponent(1)] {
//            case "1 s":
//                return 1
//        }
//    }
//    
//    func delay(delay:Double, closure:()->()) {
//        dispatch_after(
//            dispatch_time(
//                DISPATCH_TIME_NOW,
//                Int64(delay * Double(NSEC_PER_SEC))
//            ),
//            dispatch_get_main_queue(), closure)
//    }
    
    // MARK: - Actions
    
    @IBAction func playPhrase() {
        let sythesizer = AVSpeechSynthesizer()
        let phrase = AVSpeechUtterance(string: phrases[phrasePicker.selectedRowInComponent(0)])
        phrase.rate = 0.2
        sythesizer.speakUtterance(phrase)
    }
    
    @IBAction func testPhrase() {
        
    }
    
    @IBAction func confirm() {
        
    }
}
