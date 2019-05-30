# Instant Fixed Window

Instantly fix the current-window's width/height.

## What's This

Even when you use some packages which can resize window automatically (ex. [zoom.el](), [golden-ratio.el]()), 
you can fix current-window's width/height.

![img]()

## Setup

`git clone` and edit your init.el as below.

```elisp
(add-to-list 'load-path "YOUR PATH")
(require 'instant-fixed-window)
```
## Usage

It's so simple!

+ `M-x instant-fixed-window-with`: fix width
+ `M-x instant-fixed-window-height` fix height

## Tips

You can use `add-hook` to fix the window size automatically.

```elisp
(add-hook 'foo-mode (lambda() (instant-fixed-window-width)))
(add-hook 'bar-mode (lambda() (instant-fixed-window-height)))
```
