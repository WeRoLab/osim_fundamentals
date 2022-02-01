# OpenSim Fundamentals
###### This document provides a brief overview of OpenSim, including helpful tips and information about learning OpenSim.

## Importing a C3D File
One very common form of motion data you will get is a `.c3d` file. This file contains a lot of information, but your goal is to split it
into two different file types. One is a Motion file, or `.mot`, which describes the motion of the limbs. The second is a Marker file, or `.trc`,
which describes the marker coordinates at different points in time.

Loading a `.c3d` file was pretty difficult when I first tried to do it, and the online instructions were confusing. I tried to use Python originally,
but this ended up making things far too difficult, so I switched to doing Matlab. The Matlab file to read in a `.c3d` should already be on your computer,
as it was downloaded with the OpenSim download.

In my computer, it was found on the path `kathrynforrest/Documents/OpenSim/4.3/Code/Matlab`, and the file name was `c3dExport.m`. This file is well
documented on the OpenSim webiste, and the steps there are relatively straightforward. Once you have a `.trc` and a `.mot` file, you are ready to
move to OpenSim.

## To Begin
When you first open the application, you will want to load a model. To do so, go to "File" -> "Open Model" and select a model.
When you are first getting started, just pick one of the models provided with the OpenSim software.
These should be in the format `.osim`. I would reccommned starting with the `gait2354_simbody.osim` model.

## Scaling
Scaling is one of the most difficult things in OpenSim, mostly because it is often tedious, frustating, and can take longer than anticipated.
