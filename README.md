# Weaher Tracker

> Several macros(To Generate mock data and Coding keys) are used from my `RJSwiftMacros` package. For more detailed information, see the [LINK](https://github.com/rezojoglidze/RJSwiftMacros).

## Features
- `SwiftUI Framework`
- `MVVM Architecture`: here is used `Observable` macro instead of `ObservableObject`, because minimum ios version is 17.0. 

- `DIContainer`: For gateways configuration I have created `DIContainer` to change gateways type depending on where the application runs. If it runs on Preview, the gateway returns mock data. if not, the gateway makes api calls.
- `Networking`:  I have created a separate module. Here I used POP, which helped me to return mock data and real API call response.
- `Views`: On the main screen here were two views, which may be used in future for other screens, because of this I have created two components for them. 
