#Camera Hacking
##with [Kyle McDonald](http://kylemcdonald.net) and [Chris Woebken](http://www.woebken.net/)

This collection of Processing sketches illustrates some basic techniques for using automated triggers with webcams.

###Basic

This sketch demonstrates how to use Processing to interface with a camera.

###ManualTrigger

Save a frame from the camera whenever a keyboard or mouse press occurs. This is useful if you have an old USB keyboard or mouse that you can hack apart. Once you've hacked the device apart, you can use any of the switches as a camera trigger.

###TimedTrigger

Acts like an [intervalometer](https://en.wikipedia.org/wiki/Intervalometer), useful for capturing multiple images over a long period of time, creating a timelapse.

###MotionTrigger

Demonstrates a basic difference imaging technique that will save a photo when the difference exceeds a threshold. You can set off the trigger by making a large motion, or by quickly changing the light in the image.

###Remote Upload

Extends the ManualTrigger sketch, using the `curl` command line utility to upload an image to a remote server. This is useful for installations that require viewing/exhibition/storage at a very different place than the capture location. The `upload.sh` script should be modified to include your ftp information (username, password, server).