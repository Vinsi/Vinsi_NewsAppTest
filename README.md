# NewsApp Documentation
This app will have a main screen where you can switch between different modes of search like.
# FEATURES 
ON DEMAND LOADING ON SCROLL
# 1: Everything Search

# 2: Headline Search

When tapped on Top navigation it will toggle.
you can filter the search in 2 different approach by entering search term and another option is through advanced filter
where you can opt your filter and search further.

you can move to news details further by tapping details button .it will open the url associated with that news 

# Core Thirdparty libraries used can be listed in pod files

  pod 'Moya/RxSwift', '~> 11.0'      => Easy Endpoint creation
  
  pod 'PluggableApplicationDelegate' => Easy management of app Delegates
  
  pod 'ChameleonFramework'           => Easy color manager
  
  pod 'JGProgressHUD'                => Loading huds animated
  
  pod 'Kingfisher'                   => Lazy /cached image loading
  
  pod 'DateToolsSwift'               => Date in human readable way
  
  pod 'IQKeyboardManagerSwift'       => Easy Keyboard avoiding



# What i didn't implemented ?
Not added url restrictions in transport security since am accessing variuos news links within the app
Not added any SSL pinning 

