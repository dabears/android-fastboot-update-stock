# android-fastboot-update-stock
Got tired of manually running commands to update my rooted Nexus 6P to the new stock images, so I made a little script to do it for me. Nothing special, just literally what I need.

DISCLAIMER:
I take no responsibility for anything here. If your device blows up or doesn't turn on, I do not know how to fix it. This script is AS-IS and comes with no guarantee. It may not even run.

However... if you want to use it *you must have adb/fastboot installed at C:\adb and you must save & run the script from that directory*.

1. You need to download your factory image from https://developers.google.com/android/images?hl=en
2. Once it's downloaded, move the factory image zip into your adb installation folder (C:\adb)
3. Uncompress the zip and inside you'll find a series of files. *Rename this folder to angler if it isn't already.*
4. Find the zip file named image-angler-xxxxxx.zip and uncompress into the angler folder as well (don't put the files from the images zip in a new folder, keep them with the rest).
a. This script is meant for the Nexus 6P, so if you have a different device you will need to modify the folder and file names accordingly.
4. Rename bootloader-angler-angler-xx.xx.img to bootloader-angler.img because I'm lazy.
5. Rename radio-angler-angler-xx.xx.img to radio-angler.img see above.
6. Plug your phone into your computer, make sure USB Debugging is ON, etc..
6. Go back to your adb installation folder and run the script as Administrator.
7. Go nuts.
