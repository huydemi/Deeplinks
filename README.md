# Deeplinks

In this tutorial, you’ll learn:

1. **Universal Links** is the way to intercept some of the URL’s and instead of handling the URL in Safari, open a specific app page. Universal links require some backend work, so we will stick to Deep Links in this tutorial.
2. **Deep Links** act the similar way, but it handles the custom URL schemes. Its implementation is not much different, so it won’t be difficult to add a Universal Links support if you need it.
3. **Shortcut** is the way to launch on the specific page based on selected shortcut item when you force touch on the app icon. This feature requires the 3d-touch enabled device.
4. **Notifications**: when you tap the notification (either remote or local), the app will be launched on a specific page or do certain actions.

Let’s say, we are building an Apartment bookings app and we want to have a quick access to the following parts:

- My messages page (preview): accessible via shortcut
Messages (specific chat): accessible via push notification
- Create new listing: accessible via shortcut for the host profile only
- My Activity: accessible via shortcut
- Booking request: accessible both via email link (deep link) and push notification

![screenshot](https://cdn-images-1.medium.com/max/1600/1*hE8qZ7Bk-jrBdlxwzl94ig.png)

![screenshot](https://cdn-images-1.medium.com/max/1600/1*ST5y3oyOrb9a-N956dIWDA.jpeg)

![screenshot](https://cdn-images-1.medium.com/max/1600/1*JX4igMf8QWyfX_FU3721Mg.jpeg)

---

Source:

- [iOS: How to open Deep Links, Notifications and Shortcuts](https://medium.com/@stasost/ios-how-to-open-deep-links-notifications-and-shortcuts-253fb38e1696)
