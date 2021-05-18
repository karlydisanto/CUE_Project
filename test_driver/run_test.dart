import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('fit4U', () {
    // Defining all of the features and pages that will be used to find and make sure the tests are being
    // taken to the correct place clicking the correct buttons or widgets
    final loginPageFinder = find.byValueKey("login_page");
    final emailField = find.byValueKey("email_field");
    final passwordField = find.byValueKey("password_field");
    final loginFinder = find.byValueKey("login_button");
    final homeScreenFinder = find.byValueKey("home_screen");
    final beginWorkoutFinder = find.byValueKey("begin_workout");
    final workoutScreenFinder = find.byValueKey("workout_screen");
    final helpPageFinder = find.byValueKey("help_page");
    final profilePageFinder = find.byValueKey("profile_page");
    final genderFieldFinder = find.byValueKey("gender_field");
    final ageFieldFinder = find.byValueKey("age_field");
    final fitnessFieldFinder = find.byValueKey("fitness_field");
    final fitnessLevelFieldFinder = find.byValueKey("fitness_level_field");
    final daysFieldFinder = find.byValueKey("days_field");
    final goalsFieldFinder = find.byValueKey("goals_field");
    final submitButtonFinder = find.byValueKey("submit_button");
    final logoutButtonFinder = find.byValueKey("logout_button");

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    // Test to enter an email
    test('Email Text Field', () async {
      // tapping the email field
      await driver.tap(emailField);
      // entering a correct email
      await driver.enterText('kdisanto10@gmail.com');
      // waiting for that text to appear in the text field
      await driver.waitFor(find.text('kdisanto10@gmail.com'));

    });

    // Test to enter a password
    test('Password Text Field', () async {
      // tapping the password field
      await driver.tap(passwordField);
      // entering a valid password
      await driver.enterText('123456');
      // waiting for that text to appear in the text field
      await driver.waitFor(find.text('123456'));

    });

    // Test to tap the login button and be taken to the home screen
    test('Login button', () async {
      // tapping the login button
      await driver.tap(loginFinder);
      // waiting for the home screen to appear and that it is actually the homescreen
      expect(await driver.getText(homeScreenFinder), "Welcome to Fit4U!");

    });

    // Test to begin a workout and ensure that you are taken to that screen
    test('Begin Workout', () async {
      // tapping the begin workout button
      await driver.tap(beginWorkoutFinder);
      // waiting for the workout screen and making sure it is correct
      expect(await driver.getText(workoutScreenFinder), "Lets Workout!");
    });


    test('Help Page', () async {
      // tap and go back to the home page
      await driver.tap(find.byTooltip('Back'));
      // tapping the help page button
      await driver.tap(helpPageFinder);
      // waiting for the help page and making sure it is correct
      expect(await driver.getText(helpPageFinder), "Need Help?");
    });

    test('Profile', () async{
      // tap to go back to the home page
      await driver.tap(find.byTooltip('Back'));
      // tapping the profile page to get to the registration survey
      await driver.tap(profilePageFinder);
      // entering information into the survey to save the profile
      await driver.tap(genderFieldFinder);
      await driver.enterText('Female');
      // waiting for that text to appear in the text field
      await driver.waitFor(find.text('Female'));
      await driver.tap(ageFieldFinder);
      await driver.enterText('22');
      // waiting for that text to appear in the text field
      await driver.waitFor(find.text('22'));
      await driver.tap(fitnessFieldFinder);
      await driver.enterText('Running, Lacrosse');
      // waiting for that text to appear in the text field
      await driver.waitFor(find.text('Running, Lacrosse'));
      await driver.tap(fitnessLevelFieldFinder);
      await driver.enterText('Advanced');
      // waiting for that text to appear in the text field
      await driver.waitFor(find.text('Advanced'));
      await driver.tap(daysFieldFinder);
      await driver.enterText('5');
      // waiting for that text to appear in the text field
      await driver.waitFor(find.text('5'));
      await driver.tap(goalsFieldFinder);
      await driver.enterText('Stay in shape');
      // waiting for that text to appear in the text field
      await driver.waitFor(find.text('Stay in shape'));
      // tapping submit button
      await driver.tap(submitButtonFinder);
    });
    
    test('Log out', () async{
      await driver.tap(find.byTooltip('Back'));
      // finding the logout button top right
      await driver.tap(logoutButtonFinder);
      // making sure back at the login screen
      expect(await driver.getText(loginPageFinder), "Welcome");
    });

  });
}
