import UIKit
import Flutter
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

            let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
            let batteryChannel = FlutterMethodChannel(name: "ios",
                                                   binaryMessenger: controller.binaryMessenger)
         batteryChannel.setMethodCallHandler({
           (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

            if (call.method == "navigate"){
                let myViewController = MyViewController()
                myViewController.resultCallback = { resultValue in
                    result(resultValue)
                }
                controller.present(myViewController, animated: true, completion: nil)
            } else if (call.method == "passData"){
                let myViewController = MyViewController()
                let args = call.arguments as! NSString
                myViewController.passedData = String(describing: args)
                myViewController.resultCallback = { resultValue in
                    result(resultValue)
                }
                controller.present(myViewController, animated: true, completion: nil)
            }

         })      
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

public class MyViewController : UIViewController {
  var resultCallback: ((Int) -> Void)?
  var passedData: String? = ""

  let textField1 = UITextField(frame: CGRect(x: 100, y: 100, width: 250, height: 50))
  let textField2 = UITextField(frame: CGRect(x: 100, y: 150, width: 250, height: 50))
  let textFieldPassData = UITextField(frame: CGRect(x: 100, y: 1000, width: 250, height: 50))
  let buttonAdd = UIButton(type: .system)
  let buttonSubtract = UIButton(type: .system)
    let buttonMultiply = UIButton(type: .system)
    let buttonDiv = UIButton(type: .system)
    public override func viewDidLoad() {

        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        textField1.borderStyle = .roundedRect
        view.addSubview(textField1)

        // Create the second text field
        
        
        textField2.borderStyle = .roundedRect
        view.addSubview(textField2)

       
        // Create the button
        
        buttonAdd.frame = CGRect(x: 50, y: 200, width: 200, height: 30)
        buttonAdd.setTitle("+", for: .normal)
        buttonAdd.titleLabel?.font = UIFont(name:"Helvetica-Bold",size: 24)
        buttonAdd.backgroundColor = UIColor.cyan
        buttonAdd.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(buttonAdd)
        
        buttonSubtract.frame = CGRect(x:50,y: 250,width: 200,height: 30)
        buttonSubtract.setTitle("-", for: .normal)
        buttonSubtract.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
        buttonSubtract.backgroundColor = UIColor.cyan
        buttonSubtract.addTarget(self, action: #selector(buttonSubtractTapped), for: .touchUpInside)
        view.addSubview(buttonSubtract)
        
        buttonMultiply.frame = CGRect(x:50,y: 300,width: 200,height: 30)
        buttonMultiply.setTitle("*", for: .normal)
        buttonMultiply.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
        buttonMultiply.backgroundColor = UIColor.cyan
        buttonMultiply.addTarget(self, action: #selector(buttonMultipleTapped), for: .touchUpInside)
        view.addSubview(buttonMultiply)
        
        buttonDiv.frame = CGRect(x:50,y: 350,width: 200,height: 30)
        buttonDiv.setTitle("/", for: .normal)
        buttonDiv.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
        buttonDiv.backgroundColor = UIColor.cyan
        buttonDiv.addTarget(self, action: #selector(buttonDivTapped), for: .touchUpInside)
        view.addSubview(buttonDiv)
        
        
        textFieldPassData.borderStyle = .roundedRect
        view.addSubview(textFieldPassData)
        textFieldPassData.text = passedData
        
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField2.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonSubtract.translatesAutoresizingMaskIntoConstraints = false
        buttonMultiply.translatesAutoresizingMaskIntoConstraints = false
        buttonDiv.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassData.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                   textField1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                   textField1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                   textField1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                   textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                   textField2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                   textField2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                   buttonAdd.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
                   buttonAdd.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   buttonAdd.heightAnchor.constraint(equalToConstant: 44),
                   buttonAdd.widthAnchor.constraint(equalToConstant: 100),
                   buttonSubtract.topAnchor.constraint(equalTo: buttonAdd.bottomAnchor, constant: 20),
                   buttonSubtract.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   buttonSubtract.heightAnchor.constraint(equalToConstant: 44),
                   buttonSubtract.widthAnchor.constraint(equalToConstant: 100),
                   buttonMultiply.topAnchor.constraint(equalTo: buttonSubtract.bottomAnchor, constant: 20),
                   buttonMultiply.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   buttonMultiply.heightAnchor.constraint(equalToConstant: 44),
                   buttonMultiply.widthAnchor.constraint(equalToConstant: 100),
                   buttonDiv.topAnchor.constraint(equalTo: buttonMultiply.bottomAnchor, constant: 20),
                   buttonDiv.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   buttonDiv.heightAnchor.constraint(equalToConstant: 44),
                   buttonDiv.widthAnchor.constraint(equalToConstant: 100),
                   textFieldPassData.topAnchor.constraint(equalTo: buttonDiv.bottomAnchor, constant: 100),
                   textFieldPassData.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   textFieldPassData.heightAnchor.constraint(equalToConstant: 44),
                   textFieldPassData.widthAnchor.constraint(equalToConstant: 300),
               ])
        
    }
    @objc func buttonTapped() {
        guard let text1 = textField1.text, let text2 = textField2.text else {
        return
    }
    
    // Convert the values to numbers and add them
    if let number1 = Int(text1), let number2 = Int(text2) {
        let sum = number1 + number2
        resultCallback?(sum)
        dismiss(animated:true,completion:nil)
        print("The sum is \(sum)")

    } else {
        print("Invalid input")
    }
  }
    
    @objc func buttonSubtractTapped() {
        guard let text1 = textField1.text, let text2 = textField2.text else {
        return
    }
    
    if let number1 = Int(text1), let number2 = Int(text2) {
        let subtract = number1 - number2
        resultCallback?(subtract)
        dismiss(animated:true,completion:nil)
        print("The sum is \(subtract)")

    } else {
        print("Invalid input")
    }
  }
    @objc func buttonMultipleTapped() {
        guard let text1 = textField1.text, let text2 = textField2.text else {
        return
    }
    
   
    if let number1 = Int(text1), let number2 = Int(text2) {
        let multiply = number1 * number2
        resultCallback?(multiply)
        dismiss(animated:true,completion:nil)
        print("The sum is \(multiply)")

    } else {
        print("Invalid input")
    }
  }
    @objc func buttonDivTapped() {
        guard let text1 = textField1.text, let text2 = textField2.text else {
        return
    }
    
    if let number1 = Int(text1), let number2 = Int(text2) {
        if number2 != 0 {
            let div = number1 / number2
            resultCallback?(div)
            dismiss(animated:true,completion:nil)
            print("The sum is \(div)")
        }
        
    } else {
        print("Invalid input")
    }
  }
}

