# Instant Fixed Window

Instantly fix the current-window's width/height.

## What's This

Even when you use some packages which can resize window automatically (ex. [zoom](https://github.com/cyrus-and/zoom), [golden-ratio.el](https://github.com/roman/golden-ratio.el)), 
you can fix current-window's width/height.

![gif](https://gyazo.com/153e1e1c6b13d508edc62e899942fb8f)

## Setup

`git clone` and edit your init.el as below.

```elisp
(add-to-list 'load-path "YOUR PATH")
(require 'instant-fixed-window)
```
## Usage

It's so simple!

+ `M-x instant-fixed-window-width`: fix width
+ `M-x instant-fixed-window-height` fix height
+ `M-x toggle-instant-fixed-window-with`: fix or unfix width
+ `M-x toggle-instant-fixed-window-height` fix or unfix height

## Tips

You can use `add-hook` to fix the window size automatically.

```elisp
(add-hook 'foo-mode (lambda() (instant-fixed-window-width)))
(add-hook 'bar-mode (lambda() (instant-fixed-window-height)))
```
