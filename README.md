# Run Appium Tests with Ruby and RSpec on TestMu AI (Formerly LambdaTest)

<p align="center">
  <a href="https://www.testmuai.com/"><img src="https://img.shields.io/badge/MADE%20BY%20TestMu%20AI-000000.svg?style=for-the-badge&labelColor=000" alt="Made by TestMu AI"></a>
  <a href="https://rubygems.org/gems/rspec"><img src="https://img.shields.io/gem/v/rspec.svg?style=for-the-badge&labelColor=000000" alt="RSpec version"></a>
  <a href="https://community.testmuai.com/"><img src="https://img.shields.io/badge/Join%20the%20community-blueviolet.svg?style=for-the-badge&labelColor=000000" alt="Community"></a>
</p>

## Getting Started

[TestMu AI](https://www.testmuai.com/) (Formerly LambdaTest) is the world's first full-stack AI Agentic Quality Engineering platform that empowers teams to test intelligently, smarter, and ship faster. Built for scale, it offers a full-stack testing cloud with 10K+ real devices and 3,000+ browsers. With AI-native test management, MCP servers, and agent-based automation, TestMu AI supports Selenium, Appium, Playwright, and all major frameworks. 

With TestMu AI (Formerly LambdaTest), you can run Appium tests in Ruby using the RSpec framework across real mobile devices. This sample shows how to configure Ruby RSpec Appium tests to run on the TestMu AI Real Device Cloud.

- [Sign up on TestMu AI](https://www.testmuai.com/register/) (Formerly LambdaTest).
- Follow the [TestMu AI Documentation](https://www.testmuai.com/support/docs/) for the full setup walkthrough.

### Prerequisites

- Ruby (latest stable)
- Bundler
- A TestMu AI (Formerly LambdaTest) account with your username and access key

### Setup

Clone and install dependencies:

```bash
git clone https://github.com/LambdaTest/LT-appium-ruby-rspec && cd LT-appium-ruby-rspec
bundle install
```

Set your credentials as environment variables.

**macOS / Linux:**

```bash
export LT_USERNAME="YOUR_USERNAME"
export LT_ACCESS_KEY="YOUR_ACCESS_KEY"
```

**Windows:**
**Tip:**

- If you do not have any **.apk** or **.ipa** file, you can run your sample tests on LambdaTest by using our sample :link: [Android app](https://prod-mobile-artefacts.lambdatest.com/assets/docs/proverbial_android.apk) or sample :link: [iOS app](https://prod-mobile-artefacts.lambdatest.com/assets/docs/proverbial_ios.ipa).
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
**W3C Capabilities**

```bash
    caps = {
      "platformName" => "Android",
      "appium:deviceName" => "Galaxy S24",
      "appium:platformVersion" => "14",
      "appium:app" => "lt://proverbial-android",
      "appium:isRealMobile" => true,
      "appium:automationName" => "UiAutomator2",
      "lt:options" => {
        "user" => username,
        "accessKey" => accessToken,
        "build" => "RSpec-Android-Build",
        "name" => "RSpec Sample Test",
        "w3c" => true
      }
    }
```
</TabItem>

</Tabs>

**Info Note:**

- You must add the generated **APP_URL** to the `"app"` capability in the config file.
- You can generate capabilities for your test requirements with the help of our inbuilt **[Capabilities Generator tool](https://www.lambdatest.com/capabilities-generator/)**. A more Detailed Capability Guide is available [here](https://www.lambdatest.com/support/docs/desired-capabilities-in-appium/).

## Executing The Tests

1. Run the following command to make sure that all the dependencies required for the test are instaled.

```bash
set LT_USERNAME="YOUR_USERNAME"
set LT_ACCESS_KEY="YOUR_ACCESS_KEY"
```

### Run tests

```bash
bundle exec rspec spec/app_automation.rb
```

View results on your TestMu AI dashboard.

### Local testing with TestMu AI Tunnel

To test locally hosted apps, set up the TestMu AI tunnel. OS-specific guides:

- [Local Testing on Windows](https://www.testmuai.com/support/docs/local-testing-for-windows/)
- [Local Testing on macOS](https://www.testmuai.com/support/docs/local-testing-for-macos/)
- [Local Testing on Linux](https://www.testmuai.com/support/docs/local-testing-for-linux/)

Add the following to your capabilities:

```js
tunnel: true,
```

## Contributions

Contributions are welcome. Open an issue to discuss your idea before submitting a pull request. When reporting bugs, include your Ruby version, OS, and RSpec version.

## TestMu AI (Formerly LambdaTest) Community

Connect with testers and developers in the [TestMu AI Community](https://community.testmuai.com/). Ask questions, share what you are building, and discuss best practices in test automation and DevOps.
  
## TestMu AI (Formerly LambdaTest) Certifications

Earn free [TestMu AI Certifications](https://www.testmuai.com/certifications/) for testers, developers, and QA engineers. Validate your skills in Selenium, Cypress, Playwright, Appium, Espresso and more. Industry-recognized, shareable on LinkedIn, and built by practitioners, not marketers.

## Learning Resources by TestMu AI (Formerly LambdaTest)

Learn modern testing through tutorials, guides, videos, and weekly updates:

* [TestMu AI Blog](https://www.testmuai.com/blog/)
* [TestMu AI Learning Hub](https://www.testmuai.com/learning-hub/)
* [TestMu AI on YouTube](https://www.youtube.com/@TestMuAI)
* [TestMu AI Newsletter](https://www.testmuai.com/newsletter/)
  
## LambdaTest is Now TestMu AI

On **January 12, 2026**, [LambdaTest evolved to TestMu AI](https://www.testmuai.com/lambdatest-is-now-testmuai/), the world's first fully autonomous **Agentic AI Quality Engineering Platform**.

Same team. Same infrastructure. Same customer accounts. All existing LambdaTest logins, scripts, capabilities, and integrations continue to work without change.

👉 Find the new home for [LambdaTest](https://www.testmuai.com).

### How LambdaTest Evolved into TestMu AI

In 2017, we launched LambdaTest with a simple mission: make testing fast, reliable, and accessible. As LambdaTest grew, we expanded into Test Intelligence, Visual Regression Testing, Accessibility Testing, API Testing, and Performance Testing, covering the full depth of the testing lifecycle.

As software development entered the AI era, testing had to evolve, too. We rebuilt the architecture to be AI-native from the ground up, with autonomous agents that **plan, author, execute, analyze, and optimize tests** while keeping humans in the loop. The platform integrates with your repos, CI, IDEs, and terminals, continuously learning from every code change and development signal.

That evolution earned a new name: **TestMu AI**, built for an AI-first future of quality engineering. TestMu is not a new name for us. It is the name of our annual community conference, which has brought together 100,000+ quality engineers to discuss how AI would reshape testing, long before that became an industry norm. 

What started as a high-performance cloud testing platform has transformed into an AI-native, multi-agent system powering a connected, end-to-end quality layer. That evolution defined a new identity: LambdaTest evolved into TestMu AI, built for an AI-first future of quality engineering.

## Support

Got a question? Email [support@testmuai.com](mailto:support@testmuai.com) or chat with us 24x7 from our chat portal.
