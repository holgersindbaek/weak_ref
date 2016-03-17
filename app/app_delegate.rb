class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'weak_ref'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    # Create SomeView object
    some_view = SomeView.new

    # Create weak reference to object
    weak_some_view = WeakRef.new(some_view)

    # Call test_method on weak object reference
    weak_some_view.test_method

    # Nullify SomeView object
    p "some_view: #{some_view}"
    p "weak_some_view.weakref_alive?: #{weak_some_view.weakref_alive?}"
    p "weak_some_view: #{weak_some_view}"
    some_view = nil

    # Call test_method on weak object reference again
    p "some_view: #{some_view}"
    p "weak_some_view.weakref_alive?: #{weak_some_view.weakref_alive?}"
    p "weak_some_view: #{weak_some_view}"
    weak_some_view.test_method

    # Wait 3 seconds and call test_method again
    3.second.later do
        p "some_view: #{some_view}"
        p "weak_some_view.weakref_alive?: #{weak_some_view.weakref_alive?}"
        p "weak_some_view: #{weak_some_view}"
    end

    true
  end
end
