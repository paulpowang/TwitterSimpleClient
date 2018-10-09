# Project 5 - *Twitter Simple Client*

**Twitter Simple Client** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **15** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User sees app icon in home screen and styled launch screen. (1pt)
- [x] User can sign in using OAuth login flow. (1pt)
- [x] User can Logout. (1pt)
- [x] Create Data Models for User and Tweet. (1pt)
- [x] User can view last 20 tweets from their home timeline with the user profile picture, username, tweet text, and timestamp. (2pts)
- [x] User can pull to refresh. (1pt)
- [x] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet. (2pts)
- [x] Using AutoLayout, the Tweet cell should adjust it's layout for iPhone 7, Plus and SE device sizes as well as accommodate device rotation. (1pt)

The following **stretch** features are implemented:

- [ ] The current signed in user will be persisted across restarts. (1pt)
- [ ] Each tweet should display the relative timestamp for each tweet "8m", "7h". (1pt)
- [ ] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. (1pt)
- [ ] Links in tweets are clickable. (2pts)
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client. (2pts)

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.
2.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/paulpowang/TwitterSimpleClient/blob/master/src/TwitterSimpleClient_01.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' /><img src='https://github.com/paulpowang/TwitterSimpleClient/blob/master/src/TwitterSimpleClient_02.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

It took me a lot of time on figuring out what API function I can use to get the profile image. By doing this assignment, I feel getting more familiar with Class Modules. 

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library



# Project 6 - *Twitter Simple Client*

**Twitter Simple Client** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can tap on a tweet to view it in a detail view, with controls to retweet, favorite, and reply.
- [x] User can compose a new tweet by tapping on a compose button.
- [x] When composing a tweet, user sees a countdown for the number of characters remaining for the tweet (out of 140)
- [x] User can view their profile in a profile tab
- [x] User profile Contains the user header view: picture and tagline
- [x] User profile Contains a section with the users basic stats: # tweets, # following, # followers

The following **stretch** features are implemented:

- [ ] Profile view should include that user's timeline
- [ ] User can tap the profile image in any tweet to see another user's profile
- [ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet
- [ ] User sees embedded images in tweet if available
- [x] User can switch between timeline, mentions, or profile view through a tab bar
- [ ] Pulling down the profile page should blur and resize the header image.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.
2.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/paulpowang/TwitterSimpleClient/blob/master/src/Tweet_week6_02.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' /><img 

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes
Not so easy to accomplish without clear understading the structure, and API manager function.


## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library


## License

    Copyright [2018] [PoHung Wang]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
