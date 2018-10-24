import UIKit
import PlaygroundSupport

public class SetupView {
    
    let steveImage = UIImage(named: "SteveImage") as UIImage?
    let weatherImage = UIImage(named: "WeatherImage") as UIImage?
    let aboutMeImage = UIImage(named: "AboutMeImage") as UIImage?
    let wwdcImage = UIImage(named: "WWDCImage") as UIImage?
    
    // MARK: let constant to create an instance of the Setup View to be accessed in other files
    public static let instance = SetupView()
    
    // MARK: Function to define the core characteristics of each button in the interface
    public func createButton (button: UIButton, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat, cornerRadius: CGFloat) {
        button.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        button.backgroundColor = #colorLiteral(red: 0.9328449965, green: 0.9272995591, blue: 0.9371077418, alpha: 0.7998448202)
        button.layer.cornerRadius = cornerRadius
        button.imageView?.contentMode = .scaleAspectFit
    }
    
    // MARK: Function to instantiate all of the buttons in the view
    public func instansiateButtons (steveButton: UIButton, weatherButton: UIButton, aboutMeButton: UIButton, wwdcButton: UIButton, responseButton: UIButton) {
        createButton(button: steveButton, xPosition: 10, yPosition: 340, width: 170, height: 100, cornerRadius: 20)
        steveButton.setImage(steveImage, for: .normal)
        
        createButton(button: weatherButton, xPosition: 190, yPosition: 340, width: 170, height: 100, cornerRadius: 20)
        weatherButton.setImage(weatherImage, for: .normal)
        
        createButton(button: aboutMeButton, xPosition: 10, yPosition: 450, width: 170, height: 100, cornerRadius: 20)
        aboutMeButton.setImage(aboutMeImage, for: .normal)
        
        createButton(button: wwdcButton, xPosition: 190, yPosition: 450, width: 170, height: 100, cornerRadius: 20)
        wwdcButton.setImage(wwdcImage, for: .normal)
        
        createButton(button: responseButton, xPosition: 20, yPosition: 240, width: 310, height: 50, cornerRadius: 20)
        responseButton.titleLabel!.font = UIFont(name: "Avenir" , size: 20)
    }

    // MARK: This function is used to create the Label for which question was asked as well as the network retrieved answer to the question.
    public func createLabels (questionLabel: UILabel, answerLabel: UILabel) {
        questionLabel.frame = CGRect(x: 20, y: 300, width: 340, height: 30)
        questionLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        questionLabel.text = "Have a Question?"
        questionLabel.font = UIFont(name: "Avenir", size: 25)
        
        answerLabel.frame = CGRect(x: 150, y: 50, width: 185, height: 180)
        answerLabel.text = "Loading Information..."
        answerLabel.font = UIFont(name: "Avenir", size: 17)
        answerLabel.textColor = #colorLiteral(red: 0.1669141948, green: 0.1676937342, blue: 0.1695741117, alpha: 1)
        answerLabel.numberOfLines = 6
    }
    
    // MARK: This function creates the main 'Siri' Bar in which the animation bounces off of
    public func createSiriView (siriBar: UIView) {
        siriBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        siriBar.frame = CGRect(x: 0, y: 611, width: 400, height: 6)
    }
    
    // MARK: This Function creates the main background of the View that appears when a question is asked
    public func createResponseBackDrop(backdropView: UIView) {
        backdropView.frame = CGRect(x: 10, y: -500, width: 350, height: 300)
        backdropView.layer.cornerRadius = 20
        backdropView.backgroundColor = #colorLiteral(red: 0.9328449965, green: 0.9272995591, blue: 0.9371077418, alpha: 0.7998448202)
        
    }
    
    // MARK: This function sets the color and text of the button that is displayed when an answer is shown
    public func setResponseButtonView(button: UIButton, color: UIColor, text: String) {
        button.backgroundColor = color
        button.setTitle(text, for: .normal)
        button.titleLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    // MARK: This function defines the container of the image that displays when the answer is given
    public func setAnswerImage (answerImageView: UIImageView) {
        answerImageView.frame = CGRect(x: 10, y: 80, width: 110, height: 110)
        answerImageView.contentMode = .scaleAspectFit
    }
}
