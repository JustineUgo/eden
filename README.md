[![CI Workflow](https://github.com/JustineUgo/eden/actions/workflows/ci.yml/badge.svg)](https://github.com/JustineUgo/eden/actions/workflows/ci.yml)
<br><br>

# eden

Simple challenge submission

<em>PS: Screenshots of design, coming soon.</em>

## Standards

This project considers proper techniques for development.

- ##### Framework: Flutter
- ##### Software design: Clean Architecture
- ##### Dependency Injection: GetX
- ##### Routing: GetX
- ##### State management: GetX
- ##### Storage: GetStorage
- ##### DevOps (CI/CD): GitHub Actions
- ##### Test: Flutter test

### Flutter

[Flutter](https://flutter.dev/) is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.

This project depends on Flutter Channel stable, 3.0.5.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Clean Architecture

[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) is the blueprint for a modular system, which strictly follows the design principle called <b><em>separation of concerns</em></b>. More specifically, this style of architecture focuses on dividing software into layers, to simplify the development and maintenance of the system itself.

Clean Architecture is one of the most powerful solutions to build clean apps with independent data layers that multiple teams can work on. The resulting app would also be scalable, readable, <b><em>testable</em></b>, and can be easily maintained at any time.

It seperates the codebase into three main layers:
- Presentation
- Domain
- Data

##### Separation of concerns

Separation of concerns is about “order”. The overall goal of separation of concerns is to establish a well-organized system where each part fulfills a meaningful and intuitive role while maximizing its ability to adapt to change.
<br>
<p float="center">
  
  <img src="https://user-images.githubusercontent.com/50449937/190308191-caeddfdd-d806-40d2-85a7-b372722381b2.jpg" width="250" />
  
  <img src="https://user-images.githubusercontent.com/50449937/190308201-0e83f4f3-e603-4436-b145-9a2ad5b3acdb.png" width="250" />
</p><br>

### Getx

[Getx](https://pub.dev/packages/get) is an extra-light and powerful solution for Flutter. It combines high-performance <b><em>state management</em></b>, intelligent <b><em>dependency injection</em></b>, and <b><em>route management</em></b> quickly and practically.

Getx could also be used to acheive <em>Internationalization </em>, <em>Changing theme mode</em>, <em>Network calls</em>, <em>Validation</em>, <em>Storage</em>, <em>Middleware security</em> amongst others.

##### The Three pillars of GetX

 - State management
 - Dependency Injection
 - Route management

### Dependency Injection

Dependency Injection is the technique of injection/supplying instances of one class into another.

It accomodates separation of concerns as well as makes testing a breeze, not without providing a way to create shared instances.

The project uses GetX to, injection dependencies. It creates an instance like this:

```
Get.put(Controller)
```
And injects it into another class, like this:

```
Controller controller = Get.find()
```

### Routing

Navigation in a small application is not that hard you only need to use the standard navigation that flutter comes packaged with. But when your project grows you’ll want to add authentication, authorizations, dynamic links with all of this you’d probably want less time thinking how navigation is going to work with all of this and spend more time building your business logic. GetX does a good job of helping you do this using middlewares and bindings, child routes.

Whether navigating between screens, showing <em>snackbars</em>, popping <em>dialog boxes</em>, or adding <em>bottom-sheets</em> without 'context', GetX has you covered.
 
With Getx, you can easily add middleware security to your routes.
 
Instead of routing like this:

```
Navigator.of(context).push (context, builder [...])
```
Getx routes like this:
  
```
Get.to(()=>Home())
```
 
### State management

Reactive programming can alienate many people because it is said to be complicated. GetX turns reactive programming into something quite simple.

Getx has two state managers. One is a Simple state manager used with the ``GetBuilder`` function, and the other is a Reactive state manager used with ``Getx`` or ``Obx``.

### CI/CD

CI/CD is a method to frequently deliver apps to customers by introducing automation into the stages of app development. GitHub Actions makes it easy to automate all your software workflows, now with world-class CI/CD.  GitHub Actions offers workflows that can build the code in your repository and run your tests.

### Testing

Test automation is the practice of automatically reviewing and validating a software product, such as a web application, to make sure it meets predefined quality standards for code style, functionality (business logic), and user experience.

Mocktail, allow emulating a live web service or database and return specific results depending on the situation. 


## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/JustineUgo/eden.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

Run the project: 

```
flutter run 
```


## Conclusion

Eden is a basic app, that shows how a typical flutter project should consider standard software principles, aiding scalabilty.

I will be happy to answer any questions that you may have on this project. 🙂

If you liked my work, don’t forget to ⭐ star the repo.