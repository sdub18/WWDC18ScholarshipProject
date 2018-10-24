/*
Weather.com is not in any way, shape or form associated with the production of this program, Their data is mainly used for the educational demonstration of coding application.
 
Biography.com is not in any way, shape or form associated with the production of this program, Their data is mainly used for the educational demonstration of coding application.
 
Apple.com is not in any way, shape or form associated with the production of this program, Their data is mainly used for the educational demonstration of coding application.
 
9to5Mac.com is not in any way, shape or form associated with the production of this program, Their data is mainly used for the educational demonstration of coding application.
 
Github.com is not in any way, shape or form associated with the production of this program, Their data is mainly used for the educational demonstration of coding application.
*/
import UIKit

public class NetworkFunctions {
    
    public static let instance = NetworkFunctions()
    public var link = String()
    
    // MARK: This function is responsible for retreiving the data for when the Steve Button is pressed. It also starts the sound as well
    public func getSteveData(label: UILabel, button: UIButton, image: UIImageView) {
        let url = URL(string: "https://www.biography.com/people/steve-jobs-9354805")
        self.link = "https://www.apple.com/stevejobs/"
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async {
                    if let errorMessage = error?.localizedDescription
                    {
                        label.text = errorMessage
                    } else {
                        label.text = "There has been an error, could you please try again"
                    }
                }
            } else {
                let webcontent: String = String(data: data!, encoding: String.Encoding.utf8)!
                
                // MARK: Seperates componenets of HTML (from Biography.com) in order to produce the desired text
                var webArray: [String] = webcontent.components(separatedBy: "<meta name=\"twitter:description\" content=\"")
                webArray = webArray[1].components(separatedBy: "\"><meta name=\"twitter:domain\"")
                label.text = webArray[0]
                label.font = UIFont(name: "Avenir", size: 20)
                webArray.removeAll()
                
                // MARK: Seperates componenets of HTML (from Biography.com) in order to produce the desired image
                var imageArray = webcontent.components(separatedBy: "k\" url=\"https://www.biography.com/people/steve-jobs-9354805\" title=\"Steve Jobs\" text=\"Steve Jobs\" subject=\"Steve Jobs\" body=\"Steve Jobs. Steve Jobs co-founded Apple Computers with Steve Wozniak. Under Jobs' guidance, the company pioneered a series of revolutionary technologies, including the iPhone and iPad.\" image=\"")
                imageArray = imageArray[1].components(separatedBy: "\"><a class=\"m-social--button m-icon-button\" aria-label=\"f")
                let picture = imageArray[0]
                
                DispatchQueue.main.async {
                    self.getImage(imageUrl: picture, imageView: image)
                    Sounds.instance.talk(soundFileName: "Steve")
                }
                
            }
        }
        task.resume()
    }
    
    // MARK: This function retrieves and stores the data from the website into the label and picture. Then it plays the sound.
    public func getAboutMeData(label: UILabel, Button: UIButton, image: UIImageView) {
        let url = URL(string: "https://github.com/sdubois18")
        self.link = "https://github.com/sdubois18"
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async {
                    if let errorMessage = error?.localizedDescription
                    {
                        label.text = errorMessage
                    } else {
                        label.text = "There has been an error, could you please try again"
                    }
                }
            } else {
                let webcontent: String = String(data: data!, encoding: String.Encoding.utf8)!
                
                // MARK: Seperates componenets of HTML (from GitHub.com) in order to produce the desired text
                var webArray: [String] = webcontent.components(separatedBy: "profile-bio\"><div>")
                webArray = webArray[1].components(separatedBy: "</div></div>")
                label.text = webArray[0]
                label.font = UIFont(name: "Avenir", size: 20)
                webArray.removeAll()
                
                //Seperates componenets of HTML (from Github.com) in order to produce the desired image
                var imageArray = webcontent.components(separatedBy: "<img class=\"avatar width-full rounded-2\" src=\"")
                imageArray = imageArray[1].components(separatedBy: "\" width=\"230\"")
                let picture = imageArray[0]
                
                DispatchQueue.main.async {
                    self.getImage(imageUrl: picture, imageView: image)
                    Sounds.instance.talk(soundFileName: "AboutMe")
                }
                
            }
        }
        task.resume()
    }
    
    // MARK: Retrieves and stores data into label and picture with WWDC data. Then plays the recording of Ethan. This is determined randomly from two different articles. It displays either one.
    public func getWwdcData(label: UILabel, Button: UIButton, image: UIImageView) {
        let randomNumber = Int(arc4random_uniform(2))
        
        if randomNumber == 1{
            let url = URL(string: "https://9to5mac.com/2017/12/20/report-apple-to-support-cross-platform-apps-that-run-on-iphone-ipad-and-mac-next-year/")
            self.link = "https://9to5mac.com/2017/12/20/report-apple-to-support-cross-platform-apps-that-run-on-iphone-ipad-and-mac-next-year/"
            
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        if let errorMessage = error?.localizedDescription
                        {
                            label.text = errorMessage
                        } else {
                            label.text = "There has been an error, could you please try again"
                        }
                    }
                } else {
                    let webcontent: String = String(data: data!, encoding: String.Encoding.utf8)!
                    
                    // MARK: Seperates componenets of HTML (from 9to5Mac.com) in order to produce the desired text
                    var webArray: [String] = webcontent.components(separatedBy: "<title>")
                    webArray = webArray[1].components(separatedBy: "</title>")
                    label.text = webArray[0]
                    label.font = UIFont(name: "Avenir", size: 20)
                    webArray.removeAll()
                    
                    // MARK: Seperates componenets of HTML (from 9to5Mac.com) in order to produce the desired image
                    var imageArray = webcontent.components(separatedBy: "<link href=\"")
                    imageArray = imageArray[1].components(separatedBy: "\" rel=\"apple-touch-icon\" />")
                    let picture = imageArray[0]
                    
                    DispatchQueue.main.async {
                        self.getImage(imageUrl: picture, imageView: image)
                        Sounds.instance.talk(soundFileName: "WWDC1")
                    }
                    
                }
            }
            task.resume()
        } else {
            let url = URL(string: "https://9to5mac.com/2018/03/29/state-of-egpu-apple-introduces-official-egpu-support-in-macos-10-13-4-internal-display-acceleration-opt-in/")
            self.link = "https://9to5mac.com/2018/03/29/state-of-egpu-apple-introduces-official-egpu-support-in-macos-10-13-4-internal-display-acceleration-opt-in/"
            
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        if let errorMessage = error?.localizedDescription
                        {
                            label.text = errorMessage
                        } else {
                            label.text = "There has been an error, could you please try again"
                        }
                    }
                } else {
                    let webcontent: String = String(data: data!, encoding: String.Encoding.utf8)!
                    
                    // MARK: Seperates componenets of HTML (from 9to5Mac.com) in order to produce the desired text
                    var webArray: [String] = webcontent.components(separatedBy: "<title>")
                    webArray = webArray[1].components(separatedBy: "</title>")
                    label.text = webArray[0]
                    label.font = UIFont(name: "Avenir", size: 20)
                    webArray.removeAll()
                    
                    // MARK: Seperates componenets of HTML (from 9to5Mac.com) in order to produce the desired image
                    var imageArray = webcontent.components(separatedBy: "https://9to5mac.files.wordpress.com/2017/12/final-cut-pro-360-video-vr-htc-vive.jpg?quality=82&amp;strip=all 655w, ")
                    imageArray = imageArray[1].components(separatedBy: "?")
                    let picture = imageArray[0]
                    
                    DispatchQueue.main.async {
                        self.getImage(imageUrl: picture, imageView: image)
                        Sounds.instance.talk(soundFileName: "WWDC2")
                    }
                    
                }
            }
            task.resume()
        }
    }
    
    // MARK: This retrieves and stores weather data into answe label and answer picture. It then plays a recording of Ethan.
    public func getWeatherData(label: UILabel, Button: UIButton, image: UIImageView) {
        let url = URL(string: "https://weather.com/weather/tenday/l/San+Jose+CA+USCA0993:1:US")
        self.link = "https://weather.com/weather/tenday/l/San+Jose+CA+USCA0993:1:US"
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async {
                    if let errorMessage = error?.localizedDescription
                    {
                        label.text = errorMessage
                    } else {
                        label.text = "There has been an error, could you please try again"
                    }
                }
            } else {
                let webcontent: String = String(data: data!, encoding: String.Encoding.utf8)!
                
                // MARK: Seperates componenets of HTML (from Weather.com) in order to produce the desired text
                var webArray: [String] = webcontent.components(separatedBy: "\"snowDepth\":0,\"temperature\":")
                webArray = webArray[1].components(separatedBy: ",")
                label.text = webArray[0] + "° F"
                label.font = UIFont(name: "Avenir", size: 45)
                webArray.removeAll()
                
                // MARK: Seperates componenets of HTML (from Weather.com) in order to produce the desired image
                var imageArray = webcontent.components(separatedBy: "r:image\" content=\"")
                imageArray = imageArray[1].components(separatedBy: "\"><meta data-react-helmet name=")
                let picture = imageArray[0]
                
                DispatchQueue.main.async {
                    self.getImage(imageUrl: picture, imageView: image)
                    Sounds.instance.talk(soundFileName: "Weather")
                }
                
            }
        }
        task.resume()
    }
    
    // MARK: This function takes the http png link and converts it into a usable image inside of the file
    func getImage(imageUrl: String, imageView: UIImageView) {
        let url = URL(string: imageUrl)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
