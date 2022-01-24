

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnPlayAgain: UIButton!
    @IBOutlet weak var svBoard: UIStackView!
    @IBOutlet weak var naughtScore: UILabel!
    @IBOutlet weak var imgBoard: UIImageView!
    @IBOutlet weak var crossScore: UILabel!
    @IBOutlet weak var drawCount: UILabel!
    

    var scores = ScoreInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnPlayAgain.isHidden = true
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipeDown)
        
        //adding shake observer
        
        self.becomeFirstResponder()
    }

    @IBAction func onPlayAgainClicked(_ sender: Any) {
      restartGame()
    }
    
    @IBAction func onBtn1Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn1)
    }
    
    @IBAction func onBtn2Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn2)
    }
    
    @IBAction func onBtn3Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn3)
    }
    
    @IBAction func onBtn4Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn4)
    }
    
    @IBAction func onBtn5Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn5)
    }
    
    @IBAction func onBtn6Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn6)
    }
    
    @IBAction func onBtn7Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn7)
    }
    
    @IBAction func onBtn8Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn8)
    }
    
    @IBAction func onBtn9Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn9)
    }
    
    func handleButtonPressed(btn: UIButton){
        
        if(scores.crossIds.contains(btn.tag) ||
           scores.noughtsIds.contains(btn.tag)){
            return
        }
        
        if((scores.crossIds.count + scores.noughtsIds.count) == 8){
            svBoard.isHidden = true
            imgBoard.isHidden = true
            lblResult.isHidden = false
            btnPlayAgain.isHidden = false
            scores.drawCount += 1
            lblResult.text = "Its a draw"
            naughtScore.text = "Naught - \(scores.naughtScore)"
            crossScore.text = "Cross - \(scores.crossScore)"
            drawCount.text = "Draws - \(scores.drawCount)"
            
            resetValues()
            return
        }
      
        if(scores.isCross){
            scores.crossIds.append(btn.tag)
            btn.setImage(UIImage(named: "cross.png"), for: .normal)
            checkForResult(selectedBtnIds: scores.crossIds , isCross :scores.isCross)
            scores.isCross = false
        }else{
            scores.noughtsIds.append(btn.tag)
            btn.setImage(UIImage(named: "nought.png"), for: .normal)
            checkForResult(selectedBtnIds :scores.noughtsIds  , isCross :scores.isCross)
            scores.isCross = true
        }
        btn.alpha = 0
                UIView.animate(withDuration: 2) {
                    btn.alpha = 1
                }
        scores.lastTurnButton = btn
        
    }
    
    func checkForResult(selectedBtnIds :[Int] , isCross : Bool){
        if((selectedBtnIds.contains(btn1.tag) && selectedBtnIds.contains(btn2.tag) &&
           selectedBtnIds.contains(btn3.tag)) ||
           (selectedBtnIds.contains(btn4.tag) && selectedBtnIds.contains(btn5.tag) &&
              selectedBtnIds.contains(btn6.tag)) ||
           (selectedBtnIds.contains(btn7.tag) && selectedBtnIds.contains(btn8.tag) &&
               selectedBtnIds.contains(btn9.tag)) ||
           (selectedBtnIds.contains(btn1.tag) && selectedBtnIds.contains(btn4.tag) &&
              selectedBtnIds.contains(btn7.tag)) ||
              (selectedBtnIds.contains(btn2.tag) && selectedBtnIds.contains(btn5.tag) &&
                 selectedBtnIds.contains(btn8.tag)) ||
              (selectedBtnIds.contains(btn3.tag) && selectedBtnIds.contains(btn6.tag) &&
                  selectedBtnIds.contains(btn9.tag)) ||
           (selectedBtnIds.contains(btn1.tag) && selectedBtnIds.contains(btn5.tag) &&
               selectedBtnIds.contains(btn9.tag)) ||
           (selectedBtnIds.contains(btn3.tag) && selectedBtnIds.contains(btn5.tag) &&
               selectedBtnIds.contains(btn7.tag))
        ){
            displayResult(isCross : isCross)
        }
    }
    
    func displayResult(isCross :Bool){
        svBoard.isHidden = true
        imgBoard.isHidden = true
        lblResult.isHidden = false
        btnPlayAgain.isHidden = false
        if(isCross){
            scores.crossScore += 1
            lblResult.text = "Cross is the Winner"
        }else{
            scores.naughtScore += 1
            lblResult.text = "Nought is the Winner"
        }
        naughtScore.text = "Naught - \(scores.naughtScore)"
        crossScore.text = "Cross - \(scores.crossScore)"
        
        resetValues()
    }
    
    func resetValues(){
        scores.crossIds = []
        scores.noughtsIds = []
        scores.isCross = false
        btn1.setImage(nil, for: .normal)
        btn2.setImage(nil, for: .normal)
        btn3.setImage(nil, for: .normal)
        btn4.setImage(nil, for: .normal)
        btn5.setImage(nil, for: .normal)
        btn6.setImage(nil, for: .normal)
        btn7.setImage(nil, for: .normal)
        btn8.setImage(nil, for: .normal)
        btn9.setImage(nil, for: .normal)
    }
    
    func restartGame(){
        btnPlayAgain.isHidden = true
        lblResult.isHidden = true
        svBoard.isHidden = false
        imgBoard.isHidden = false
    }
    
    @objc func onSwipe(gesture: UISwipeGestureRecognizer) {
        resetValues()
        restartGame()
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            undoLastTurn()
        }
    }
    
    func undoLastTurn(){
        if(scores.lastTurnButton == nil){
            return
        }
        
        if(scores.isCross){
            //last turn was of naught
            if let index = scores.noughtsIds.firstIndex(of: scores.lastTurnButton!.tag) {
                scores.noughtsIds.remove(at: index)
            }
            scores.isCross = false
        }else{
            //last turn was of cross
            if let index = scores.crossIds.firstIndex(of: scores.lastTurnButton!.tag) {
                scores.crossIds.remove(at: index)
            }
            scores.isCross = true
        }
        scores.lastTurnButton!.setImage(nil, for: .normal)
    }
}

