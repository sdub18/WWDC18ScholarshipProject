
import UIKit
import PlaygroundSupport
import AVFoundation

class MainView: UIViewController {
    
    // MARK: Instantiate the Main Layers of the application
    let responseImageView = UIImageView()
    
    // MARK: Siri View
    let thirdLeftPulseUp = CAShapeLayer()
    let thirdLeftPulseDown = CAShapeLayer()
    let secondLeftPulseUp = CAShapeLayer()
    let secondLeftPulseDown = CAShapeLayer()
    let firstLeftPulseUp = CAShapeLayer()
    let firstLeftPulseDown = CAShapeLayer()
    let CenterPulseUp = CAShapeLayer()
    let CenterPulseDown = CAShapeLayer()
    let firstRightPulseUp = CAShapeLayer()
    let firstRightPulseDown = CAShapeLayer()
    let secondRightPulseUp = CAShapeLayer()
    let secondRightPulseDown = CAShapeLayer()
    let thirdRightPulseUp = CAShapeLayer()
    let thirdRightPulseDown = CAShapeLayer()
    
    // MARK: Buttons
    let steveButton = UIButton()
    let aboutMeButton = UIButton()
    @objc let weatherButton = UIButton()
    let wwdcButton = UIButton()
    let responseButton = UIButton()
    
    let siriView = UIView()
    let responseView = UIView()
    
    // MARK: Labels
    let questionLabel = UILabel()
    let answerLabel = UILabel()
    
    // MARK: Images
    let steveImageView = UIImageView()
    let aboutMeImageView = UIImageView()
    let weatherImageView = UIImageView()
    let wwdcImageView = UIImageView()
    let answerImageView = UIImageView()
    
    // MARK: View Did Load
    override func viewDidLoad() {
        
        // MARK: Setup the local outlets of the view as well as main Siri Animation View
        setUpView()
        
        // MARK: Instatiate the Siri View for the opening of the app
        generateSiriAnimation(width: 100, height: 120, time: 16)
        
        // MARK: Commense Introduction
        Sounds.instance.talk(soundFileName: "Intro")
    }
    
    // MARK: Function to setup the entirety of the 'Ethan' view
    func setUpView() {
        
        /// MARK: Main function to set up the view
        SetupView.instance.instansiateButtons(steveButton: steveButton, weatherButton: weatherButton, aboutMeButton: aboutMeButton, wwdcButton: wwdcButton, responseButton: responseButton)
        SetupView.instance.createSiriView(siriBar: siriView)
        SetupView.instance.createLabels(questionLabel: questionLabel, answerLabel: answerLabel)
        SetupView.instance.createResponseBackDrop(backdropView: responseView)
        SetupView.instance.setAnswerImage(answerImageView: answerImageView)
        
        // MARK: Add Button actions for each button
        steveButton.addTarget(self, action: #selector(steveButtonPressed), for: .touchUpInside)
        aboutMeButton.addTarget(self, action: #selector(aboutMeButtonPressed), for: .touchUpInside)
        weatherButton.addTarget(self, action: #selector(weatherButtonPressed), for: .touchUpInside)
        wwdcButton.addTarget(self, action: #selector(wwdcButtonPressed), for: .touchUpInside)
        responseButton.addTarget(self, action: #selector(responseButtonPressed), for: .touchUpInside)
        
        // MARK: Setup Main View
        view.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
        view.backgroundColor = #colorLiteral(red: 0.1669141948, green: 0.1676937342, blue: 0.1695741117, alpha: 1)
        
        // MARK: Add all views to the main view
        view.addSubview(siriView)
        view.layer.addSublayer(firstRightPulseUp)
        view.layer.addSublayer(firstRightPulseDown)
        view.layer.addSublayer(secondRightPulseUp)
        view.layer.addSublayer(secondRightPulseDown)
        view.layer.addSublayer(thirdRightPulseUp)
        view.layer.addSublayer(thirdRightPulseDown)
        view.layer.addSublayer(CenterPulseDown)
        view.layer.addSublayer(firstLeftPulseUp)
        view.layer.addSublayer(firstLeftPulseDown)
        view.layer.addSublayer(secondLeftPulseUp)
        view.layer.addSublayer(secondLeftPulseDown)
        view.layer.addSublayer(thirdLeftPulseUp)
        view.layer.addSublayer(thirdLeftPulseDown)
        view.layer.addSublayer(CenterPulseUp)
        view.addSubview(steveButton)
        view.addSubview(weatherButton)
        view.addSubview(aboutMeButton)
        view.addSubview(wwdcButton)
        view.addSubview(responseView)
        view.addSubview(questionLabel)
        responseView.addSubview(answerLabel)
        responseView.addSubview(responseButton)
        responseView.addSubview(answerImageView)
    }
    // MARK: Function to compose the entire Siri Animation as well as duration
    func generateSiriAnimation (width: Int, height: Int, time: Double) {
        
        // MARK: Variables to prepare the Siri view
        let center = Int(view.frame.size.width / 2) - (width * 1/3)
        
        // MARK: Functions to develop each specific Siri "Pulse" (one Piece of the wave)
        Animation.instance.generateSiriPulse(positiveArcLayer: firstLeftPulseUp, negativeArcLayer: firstLeftPulseDown, width: width / 1, height: height / 1, startPointX: center - (width / 2), color: #colorLiteral(red: 0.2156862745, green: 0.5294117647, blue: 0.968627451, alpha: 0.6462168237), time: time)
        Animation.instance.generateSiriPulse(positiveArcLayer: secondLeftPulseUp, negativeArcLayer: secondLeftPulseDown, width: width / 2, height: height / 1, startPointX: center - (width * 3/4), color: #colorLiteral(red: 0.9019607843, green: 0.3137254902, blue: 0.3921568627, alpha: 0.6492669092), time: time)
        Animation.instance.generateSiriPulse(positiveArcLayer: thirdLeftPulseUp, negativeArcLayer: thirdLeftPulseDown, width: width / (7/3), height: height / 2, startPointX: center - width * 17/16, color: #colorLiteral(red: 0.9411764706, green: 0.6666666667, blue: 0.9803921569, alpha: 0.6520761986), time: time)
        Animation.instance.generateSiriPulse(positiveArcLayer: firstRightPulseUp, negativeArcLayer: firstRightPulseDown, width: width / 2, height: height / 2, startPointX: center + (width), color: #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.5960784314, alpha: 0.645307149), time: time)
        Animation.instance.generateSiriPulse(positiveArcLayer: secondRightPulseUp, negativeArcLayer: secondRightPulseDown, width: width / 2, height: height / 1, startPointX: center + (width * 3/7), color: #colorLiteral(red: 0.5098039216, green: 0.9803921569, blue: 0.5764705882, alpha: 0.6492401541), time: time)
        Animation.instance.generateSiriPulse(positiveArcLayer: thirdRightPulseUp, negativeArcLayer: thirdRightPulseDown, width: width / 2, height: height / 2, startPointX: center + (width * 2/3), color: #colorLiteral(red: 0.5098039216, green: 0.9803921569, blue: 0.9803921569, alpha: 0.6533336901), time: time)
        Animation.instance.generateSiriPulse(positiveArcLayer: CenterPulseUp, negativeArcLayer: CenterPulseDown, width: width * 2/3, height: height, startPointX: center, color: #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 0.7290239726), time: time)
    }
    
    // MARK: The action called when the Steve Button is pressed
    @objc func steveButtonPressed() {
        SetupView.instance.setResponseButtonView(button: responseButton, color: #colorLiteral(red: 0.03912555054, green: 0.038901072, blue: 0.03930328786, alpha: 0.8128745719), text: "Visit Apple's Wesbite")
        questionLabel.text = "Who was Steve Jobs?"
        answerLabel.text = "Loading Information..."
        answerImageView.image = UIImage(named: "")
        answerLabel.font = UIFont(name: "Avenir", size: 20)
        generateSiriAnimation(width: 100, height: 120, time: 17)
        Animation.instance.moveDown(View: responseView)

        NetworkFunctions.instance.getSteveData(label: answerLabel, button: responseButton, image: answerImageView)
    }
    
    // MARK: The action called when the Weather Button is pressed
    @objc func weatherButtonPressed() {
        SetupView.instance.setResponseButtonView(button: responseButton, color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.8831335616), text: "Visit Weather.com")
        questionLabel.text = "What's the Weather Today?"
        answerLabel.text = "Loading Information..."
        answerImageView.image = UIImage(named: "")
        answerLabel.font = UIFont(name: "Avenir", size: 20)
        generateSiriAnimation(width: 100, height: 120, time: 13)
        Animation.instance.moveDown(View: responseView)
        
        NetworkFunctions.instance.getWeatherData(label: answerLabel, Button: responseButton, image: answerImageView)

    }
    
    // MARK: The action called when the AboutMe Button is pressed
    @objc func aboutMeButtonPressed() {
        SetupView.instance.setResponseButtonView(button: responseButton, color: #colorLiteral(red: 0, green: 0.6933025122, blue: 0, alpha: 0.9429580479), text: "See Sam's Github Account")
        questionLabel.text = "Who created You?"
        answerLabel.text = "Loading Information..."
        answerImageView.image = UIImage(named: "")
        answerLabel.font = UIFont(name: "Avenir", size: 20)
        generateSiriAnimation(width: 100, height: 120, time: 15)
        Animation.instance.moveDown(View: responseView)
        
        NetworkFunctions.instance.getAboutMeData(label: answerLabel, Button: responseButton, image: answerImageView)

    }
    
    // MARK: The action called when the WWDC Button is pressed
    @objc func wwdcButtonPressed() {
        SetupView.instance.setResponseButtonView(button: responseButton, color: #colorLiteral(red: 0.1294117647, green: 0.2745098039, blue: 0.6823529412, alpha: 1), text: "View Article by 9to5Mac")
        questionLabel.text = "What do you expect to see at WWDC?    "
        questionLabel.adjustsFontSizeToFitWidth = true
        answerLabel.text = "Loading Information..."
        answerImageView.image = UIImage(named: "")
        answerLabel.font = UIFont(name: "Avenir", size: 20)
        generateSiriAnimation(width: 100, height: 120, time: 15)
        Animation.instance.moveDown(View: responseView)
        
        NetworkFunctions.instance.getWwdcData(label: answerLabel, Button: responseButton, image: answerImageView)
        
    }
    
    // MARK: The action called when the Response Button is pressed
    @objc func responseButtonPressed() {
        if let url = URL(string: NetworkFunctions.instance.link) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
PlaygroundPage.current.liveView = MainView()
PlaygroundPage.current.needsIndefiniteExecution = true
