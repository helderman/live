# Presenter tooling

I have been using a Windows 10 desktop (Linux would be fine too)
with the following tooling pre-installed.

- A modern web browser like
  [Chrome](https://en.wikipedia.org/wiki/Google_Chrome) or
  [Firefox](https://en.wikipedia.org/wiki/Firefox).
- Git Bash
- [vim](https://en.wikipedia.org/wiki/Vim_(text_editor))
  (typically comes as part of Git Bash).
- [IIS](https://en.wikipedia.org/wiki/Internet_Information_Services)
  or any other web server.
- [GIMP](https://en.wikipedia.org/wiki/GIMP).
- [SoX](https://en.wikipedia.org/wiki/SoX).
  On Microsoft Windows, you need version 14.4.1 rather than 14.4.2,
  as the latter has a broken default output device.
- When presenting online: proper streaming software.
  I used WebEx; it was a disaster because:
  - 'Optimized for video and motion' gave viewers a black screen.
  - The alternative ('optimized for text')
    gave jerky animation and no streaming of audio output.
  - Many GIMP mouse events were swallowed.
  - Some GIMP shortcut keys were captured
    (e.g. Ctrl-M became 'mute' instead of 'merge layer down').

Next, configure the tools.

- Customize <i>vim</i>
  by putting this [.vimrc](.vimrc) in the home directory.
- Make sure you can call <i>sox</i> from Git Bash;
  typically by adding the following line to `~/.bashrc`:
  ```
  PATH="$PATH:/c/Program Files (x86)/sox-14-4-1"
  ```
- In your web server, make a web application for your working folder.
- In GIMP, make 'transparency' the default fill for every new image
  (Edit - Preferences - Default Image - Fill with).
  Also bookmark your working folder
  (there's a `+` button for that in every file dialog in GIMP),
  for quick access when saving an image.

To prepare yourself right before the presentation:

- Shut down instant messengers, email clients
  and other potential disturbance factors
  (expect the streaming channel itself,
  and if necessary, a hotline with a cornerman monitoring streaming quality).
- Have a glass of water at the ready, to prevent a coughing fit.
- Open any web pages you need.
  - The landing page
    [https://helderman.github.io/live/](https://helderman.github.io/live/).
    From there, go to the intro video,
	so that a single click on the web browser's 'back' button
	will bring you back to the landing page.
  - Your local web application.
  - [Desmos](https://www.desmos.com/calculator);
    prepare the first equation `(t, 2*t*t)`, range `-2 <= t <= 2`
	and zoom factor (unit circle).
- Open Git Bash; `cd` to your working folder.
- Open another Git Bash for pushing commits.
- Push the landing page to attendees (e.g. through chat):
  "Hi everyone, follow my commits here:
  [https://helderman.github.io/live/](https://helderman.github.io/live/)"
