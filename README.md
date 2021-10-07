# Application: basic_mission_f330_pixhawk

This application illustrates a mission execution with a real drone. The mission is created for the f330 drone frame, using the pixhawk 4 autopilot board and an onboard computer. Autopilot boards compatibility can be checked in the px4_autopilot webpage: https://px4.io/autopilots/

The source of localization is the following camera:

- Intel® RealSense™ Tracking Camera T265. Store link is: https://www.intelrealsense.com/tracking-camera-t265/

In order to execute the project you must execute the following commands in the onboard computer:

	$ ./install_dependencies.sh

Execute the installation of RealSense camera:

	$ ./install_realsense_sdk.sh

Execute the script that launches the mission with realsense:

        $ ./rs_t265_main_launcher_pid.sh

Wait until the alphanumeric_viewe window is presented and change to "Navigation" display (pressing "N" key).

Ensure that data about localization is presented (this may takes some seconds) with a screen similar to the following image: 

<img src="https://github.com/aerostack/basic_mission_f330_pixhawk/blob/v5-libeccio/doc/alphanumeric_viewer.png" width=600>

Execute the command for starting the mission execution:

        $ rosservice call /drone1/python_based_mission_interpreter_process/start

The following video shows the execution of the mission with extra debugging windows:

[ ![basic_mission_f330_pixhawk](https://github.com/aerostack/basic_mission_f330_pixhawk/blob/v5-libeccio/doc/video_thumbnail.png)](https://www.youtube.com/watch?v=lD_eYQEAXpM)

Alternatively, you can use Optitrack (https://optitrack.com/systems/) as a source of localization instead of the realsense. In this case, instead of launching the mission with realsense, you should execute the following launcher:

        $ ./optitrack_main_launcher_pid.sh
