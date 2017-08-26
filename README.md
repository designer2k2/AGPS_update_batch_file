# Sony GPS Assist Data windows batch file updater
Copy the gps_update.bat in the root directory from your SD-card, and run it.
It will create the sub directory if needed and download all needed files and then checks the download for corruption.

This should run on all versions of windows, as it uses build in methods, no additional installations needed!


See the Wiki: [Wiki on AGPS update batch file ](https://github.com/designer2k2/AGPS_update_batch_file/wiki)

## Usage:

after copying it to the SD card, run it, and repeat it every time you copy images to the pc. 

The data is valid for 6 weeks after downloading, the exact date can be checked on the camera:

Menu -> Settings 1 -> GPS-Settings -> **GPS-assist data**

## Background:

it downloads the http://control.d-imaging.sony.co.jp/GPS/assistme.dat and http://control.d-imaging.sony.co.jp/GPS/assistme.md5 using the "bitsadmin.exe /transfer".
Then makes MD5 check using "certUtil -hashfile".
