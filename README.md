# LT-appium-ruby-rspec — TestMu AI (Formerly LambdaTest)

<p align="center">
  <a href="https://www.testmuai.com/blog/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-rspec" target="_bank">Blog</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/support/docs/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-rspec" target="_bank">Docs</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/learning-hub/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-rspec" target="_bank">Learning Hub</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/newsletter/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-rspec" target="_bank">Newsletter</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/certifications/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-rspec" target="_bank">Certifications</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.youtube.com/@TestMuAI" target="_bank">YouTube</a>
</p>
&emsp;
&emsp;
&emsp;

*RSpec is a computer domain-specific language testing tool written in the programming language Ruby to test Ruby code. It is a behavior-driven development framework which is extensively used in production applications.. Perform Appium automation tests on [TestMu AI's online cloud](https://www.testmuai.com/appium-mobile-testing).*

*Learn the basics of [Appium testing on the TestMu AI platform.](https://www.testmuai.com/support/docs/getting-started-with-appium-testing/)*

[<img height="53" width="200" src="https://user-images.githubusercontent.com/70570645/171866795-52c11b49-0728-4229-b073-4b704209ddde.png">](https://accounts.lambdatest.com/register)

## Table of Contents

* [Pre-requisites](#pre-requisites)
* [Run Your First Test](#run-your-first-test)
* [Executing The Tests](#executing-the-tests)

## Pre-requisites

Before you can start performing Ruby automation testing with Appium, you would need to:

- Install **Ruby** and **gem** on your local system. Follow these instructions to install on different operating systems.

  - For **Windows**, you can download from the [official website](https://rubyinstaller.org/downloads/).
  - For **Linux** or **Ubuntu**, you can run a simple apt command like below:

    ```bash
    sudo apt-get install ruby-full
    ```

  - For **macOS**, you can run a [Homebrew](https://brew.sh/) command like this:

    ```bash
    brew install ruby
    ```

- Ensure you have Dependency manager **bundler** installed. If not installed, you can install with the following command -

  ```
  gem install bundler
  ```

### Clone The Sample Project

Clone the TestMu AI’s [LT-appium-ruby-rspec](https://github.com/LambdaTest/LT-appium-ruby-rspec) and navigate to the code directory as shown below:

```bash
git clone https://github.com/LambdaTest/LT-appium-ruby-rspec
cd LT-appium-ruby-rspec
```

### Setting Up Your Authentication

Make sure you have your TestMu AI credentials with you to run test automation scripts on LambdaTest. To obtain your access credentials, [purchase a plan](https://billing.lambdatest.com/billing/plans) or access the [Automation Dashboard](https://appautomation.lambdatest.com/).

Set TestMu AI `Username` and `AccessKey` in environment variables.

**For Linux/macOS:**

```js
export LT_USERNAME=LT_USERNAME \
export LT_ACCESS_KEY=LT_ACCESS_KEY
```
  
**For Windows:**

```js
set LT_USERNAME=LT_USERNAME `
set LT_ACCESS_KEY=LT_ACCESS_KEY
```
  
### Upload Your Application

Upload your **_iOS_** application (.ipa file) or **_android_** application (.apk file) to the TestMu AI servers using our **REST API**. You need to provide your **Username** and **AccessKey** in the format `Username:AccessKey` in the **cURL** command for authentication. Make sure to add the path of the **appFile** in the cURL request. Here is an example cURL request to upload your app using our REST API:

 **Using App File from System:**

```bash
curl -u "${ YOUR_LAMBDATEST_USERNAME()}:${ YOUR_LAMBDATEST_ACCESS_KEY()}" -X POST "https://manual-api.lambdatest.com/app/upload/realDevice" -F "appFile=@"/Users/macuser/Downloads/proverbial_android.apk""
```

**Using App URL:**

```bash
curl -u "${ YOUR_LAMBDATEST_USERNAME()}:${ YOUR_LAMBDATEST_ACCESS_KEY()}" -X POST "https://manual-api.lambdatest.com/app/upload/realDevice" -F "url=:https://prod-mobile-artefacts.lambdatest.com/assets/docs/proverbial_android.apk" -F "name=Proverbial_App"
```

**Tip:**

- If you do not have any **.apk** or **.ipa** file, you can run your sample tests on TestMu AI by using our sample :link: [Android app](https://prod-mobile-artefacts.lambdatest.com/assets/docs/proverbial_android.apk) or sample :link: [iOS app](https://prod-mobile-artefacts.lambdatest.com/assets/docs/proverbial_ios.ipa).
- Response of above cURL will be a **JSON** object containing the `APP_URL` of the format - <lt://APP123456789123456789> and will be used in the next step.

## Run Your First Test

**Test Scenario:** Check out [single.config.yml](https://github.com/LambdaTest/LT-appium-ruby-cucumber/blob/master/Android/examples/First_test/features/step_definitions/first_steps.rb) file to view the sample test script for single test case and [parallel.config.yml](https://github.com/LambdaTest/LT-appium-ruby-cucumber/blob/master/iOS/examples/First_test/features/step_definitions/first_steps.rb) for parallel test cases.

### Configuring Your Test Capabilities

You can update your custom capabilities in test scripts. In this sample project, we are passing platform name, platform version, device name and app url (generated earlier) along with other capabilities like build name and test name via capabilities object. The capabilities object in the sample code are defined as:

<Tabs className="docs__val">

<TabItem value="ios-config" label="iOS" default>

```ruby title="iOS(.ipa)"

common_caps:
  "build": "RSpec Appium"
  "visual": false
  "network": false
  "console": false

app_caps:
  -
    "isRealMobile": "true"
    "platform": "iOS"
    "deviceName": "iPhone 13 Pro"
    "platformVersion": "15.0"
    "app": "APP_URL"   #Add the app (.ipa) url here
```

</TabItem>
<TabItem value="android-config" label="Android" default>

```ruby title="Android(.apk)"
common_caps:
  "build": "RSpec Appium"
  "visual": false
  "network": false
  "console": false

app_caps:
  -
    "isRealMobile": "true"
    "platform": "Android"
    "deviceName": "Galaxy A31"
    "platformVersion": "10"
    "app": "APP_URL"   #Add the app (.apk) url here
```

</TabItem>

</Tabs>

**Info Note:**

- You must add the generated **APP_URL** to the `"app"` capability in the config file.
- You can generate capabilities for your test requirements with the help of our inbuilt **[Capabilities Generator tool](https://www.testmuai.com/capabilities-generator/)**. A more Detailed Capability Guide is available [here](https://www.testmuai.com/support/docs/desired-capabilities-in-appium/).

## Executing The Tests

1. Run the following command to make sure that all the dependencies required for the test are instaled.

```bash
bundle install
```

2. Execute the following command to run single test on TestMu AI platform:

```bash
bundle exec rake single
```

> In order to run parallel tests, run `bundle exec rake parallel`.


**Info:** Your test results would be displayed on the test console (or command-line interface if you are using terminal/cmd) and on the :link: [TestMu AI App Automation Dashboard](https://appautomation.lambdatest.com/build).

## Additional Links

- [How to test locally hosted apps](https://www.testmuai.com/support/docs/testing-locally-hosted-pages/)
- [How to integrate TestMu AI with CI/CD](https://www.testmuai.com/support/docs/integrations-with-ci-cd-tools/)

## Documentation & Resources :books:
      
Visit the following links to learn more about TestMu AI's features, setup and tutorials around test automation, mobile app testing, responsive testing, and manual testing.

* [TestMu AI Documentation](https://www.testmuai.com/support/docs/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber)
* [TestMu AI Blog](https://www.testmuai.com/blog/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber)
* [TestMu AI Learning Hub](https://www.testmuai.com/learning-hub/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber)    

## TestMu AI Community :busts_in_silhouette:

The [TestMu AI Community](https://community.testmuai.com/) allows people to interact with tech enthusiasts. Connect, ask questions, and learn from tech-savvy people. Discuss best practises in web development, testing, and DevOps with professionals from across the globe 🌎

## What's New At TestMu AI ❓

To stay updated with the latest features and product add-ons, visit [Changelog](https://changelog.lambdatest.com/)

## 🚀 [LambdaTest is Now TestMu AI](https://www.testmuai.com/lambdatest-is-now-testmuai/)

👋 Welcome to TestMu AI, the next evolution of LambdaTest. As of January 2026, LambdaTest has officially rebranded to TestMu AI. We have evolved from a cross-browser testing cloud into a unified, AI-native quality engineering platform designed for the modern DevOps era.

Whether you have been part of the LambdaTest community for years or are just discovering TestMu AI, our mission remains the same: to help you ship faster with high-scale test execution, autonomous testing, and deep quality analytics.

**🔄 Our Rebrand Journey**

We chose the name TestMu AI to reflect our shift towards intelligent, autonomous testing. While our identity has changed, our core technology and commitment to the testing community stay the same.

**✨ Specialties**

- 🤖 AI-Native Test Execution (Formerly LambdaTest)
- ⚡ Autonomous Test Automation
- 🌐 Cross-Browser & Mobile Testing
- 📊 Unified Quality Intelligence

👉 Find [LambdaTest's New Home](https://www.testmuai.com/).