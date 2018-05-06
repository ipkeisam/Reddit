# Reddit
This is a Swift project that queries the reddit api (as its unauthenticated) and displays posts in a scrollable view (UITableView). 
 
Please review this project with best practices.

For each post returned from the API, the app displays the image, title, comment number and score.

Reddit API URL - http://www.reddit.com/.json

This project also contains the infinite scrolling feature by getting the next set of post when the user scrolls past the fetched data.

Next URL - http://www.reddit.com/.json?after= + afterLink
