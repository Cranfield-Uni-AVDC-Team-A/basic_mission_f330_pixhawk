# Application: basic_mission_f330_pixhawk

This application illustrates a real world mission. The mission is created for the f330 drone frame, using the pixhawk 4 autopilot board and an onboard computer. Autopilot boards compatibility can be checked in the px4_autopilot webpage: https://px4.io/autopilots/

A source of localization is also required, we provide the project with two ways of localization for which all the required functionalities are included:

-  Intel® RealSense™ Tracking Camera T265. Buy link is: https://www.intelrealsense.com/tracking-camera-t265/

- Optitrack. Buy link is: https://optitrack.com/systems/

In order to execute the project you must execute the following commands in the onboard computer:

	$ ./install_dependencies.sh

	If you want to use the realsense localization methon, also run:

	$ ./install_realsense_sdk.sh

Execute the script that launches the mission with your prefered localization method:

	For Intel® RealSense™ Tracking Camera T265

        $ ./rs_t265_main_launcher_pid.sh

	For Optitrack

        $ ./optitrack_main_launcher_pid.sh

Wait a couple seconds and make sure localization is working propery (might be useful to change to "Navigation" display in the alphanumeric_viewer window):

<img src="https://github.com/aerostack/basic_mission_f330_pixhawk/blob/v5-libeccio/doc/alphanumeric_viewer.png" width=600>

- Execute the command for starting the mission execution:

        $ rosservice call /drone1/python_based_mission_interpreter_process/start

The following video shows the execution of the mission with extra debugging windows:

[ ![basic_mission_f330_pixhawk](https://github.com/aerostack/basic_mission_f330_pixhawk/blob/v5-libeccio/doc/video_thumbnail.png)](https://www.youtube.com/watch?v=lD_eYQEAXpM)

