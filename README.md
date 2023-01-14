# DI-tutorial

My first beautiful simple application based on tutorial of how to use DI in swift.

I learned how to add Targets in project and build app from independent parts.
It only fetch data from API and shows in TableView. But In contrast of other my projects, this app consists of three independent parts:  
- Public shared contracts, 
- Api Manager depends only Contracts, and contain all logic for work with api. 
- UI part, also depends only Contracts, contain  all logic for work with UI to show data in table view

![image](https://user-images.githubusercontent.com/29074231/212493599-a0f1d787-1366-48df-8e0a-4150a5719bcd.png)
![image](https://user-images.githubusercontent.com/29074231/212493602-3b78b6e6-b14c-4e4f-a10e-f4fcb850ed74.png)


links:

public api for data some random users: https://randomuser.me

base tutorial: https://www.youtube.com/watch?v=ooUyCbO4hNw
