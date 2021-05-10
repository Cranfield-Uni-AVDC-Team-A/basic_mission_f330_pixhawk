#!/bin/bash

NUMID_DRONE=1
MAV_NAME=pixhawk
export AEROSTACK_PROJECT=${AEROSTACK_STACK}/projects_test/f330_pixhawk

. ${AEROSTACK_STACK}/config/mission/setup.sh
#---------------------------------------------------------------------------------------------
# INTERNAL PROCESSES
#---------------------------------------------------------------------------------------------
gnome-terminal \
`#---------------------------------------------------------------------------------------------` \
`# alphanumeric_viewer                                                                         ` \
`#---------------------------------------------------------------------------------------------` \
--tab --title "alphanumeric_viewer"  --command "bash -c \"
roslaunch alphanumeric_viewer alphanumeric_viewer.launch --wait \
    drone_id_namespace:=drone$NUMID_DRONE \
    my_stack_directory:=${AEROSTACK_PROJECT};
exec bash\"" \
`#---------------------------------------------------------------------------------------------` \
`# Belief Memory Viewer                                                                        ` \
`#---------------------------------------------------------------------------------------------` \
--tab --title "Belief memory Viewer" --command "bash -c \"
roslaunch belief_memory_viewer belief_memory_viewer.launch \
  robot_namespace:=drone$NUMID_DRONE \
  drone_id:=$NUMID_DRONE ;
exec bash\"" \
`#---------------------------------------------------------------------------------------------` \
`# Belief Manager                                                                              ` \
`#---------------------------------------------------------------------------------------------` \
--tab --title "Belief Manager" --command "bash -c \"
roslaunch belief_manager_process belief_manager_process.launch --wait \
  drone_id_namespace:=drone$NUMID_DRONE \
  drone_id:=$NUMID_DRONE \
  config_path:=${AEROSTACK_PROJECT}/configs/mission;
exec bash\"" \
`#---------------------------------------------------------------------------------------------` \
`# Belief Updater                                                                              ` \
`#---------------------------------------------------------------------------------------------` \
--tab --title "Belief Updater" --command "bash -c \"
roslaunch belief_updater_process belief_updater_process.launch --wait \
  drone_id_namespace:=drone$NUMID_DRONE \
  drone_id:=$NUMID_DRONE;
exec bash\"" \
`#---------------------------------------------------------------------------------------------` \
`# Basic Quadrotor Behaviors                                                                   ` \
`#---------------------------------------------------------------------------------------------` \
--tab --title "Basic Quadrotor Behaviors" --command "bash -c \"
roslaunch basic_quadrotor_behaviors basic_quadrotor_behaviors.launch --wait \
  namespace:=drone$NUMID_DRONE;
exec bash\"" \
`#---------------------------------------------------------------------------------------------` \
`# Quadrotor Motion With PID Control                                                           ` \
`#---------------------------------------------------------------------------------------------` \
--tab --title "Quadrotor Motion With PID Control" --command "bash -c \"
roslaunch quadrotor_motion_with_pid_control quadrotor_motion_with_pid_control.launch --wait \
    namespace:=drone$NUMID_DRONE \
    robot_config_path:=${AEROSTACK_PROJECT}/configs/drone$NUMID_DRONE;
exec bash\"" \
`#---------------------------------------------------------------------------------------------` \
`# Behavior Execution Viewer                                                                   ` \
`#---------------------------------------------------------------------------------------------` \
--tab --title "Behavior Execution Viewer" --command "bash -c \"
roslaunch behavior_execution_viewer behavior_execution_viewer.launch --wait \
  robot_namespace:=drone$NUMID_DRONE \
  drone_id:=$NUMID_DRONE \
  catalog_path:=${AEROSTACK_PROJECT}/configs/mission/behavior_catalog.yaml;
exec bash\"" \
`#---------------------------------------------------------------------------------------------` \
`# mavros                                                                                      ` \
`#---------------------------------------------------------------------------------------------` \
--tab --title "mavros" --command "bash -c \"
roslaunch mavros px4.launch --wait;
exec bash\"" \
`#---------------------------------------------------------------------------------------------` \
`# keyboard_teleoperation_with_pid_control                                                     ` \
`#---------------------------------------------------------------------------------------------` \
--window --title "keyboard_teleoperation_with_pid_control"  --command "bash -c \"
roslaunch keyboard_teleoperation_with_pid_control keyboard_teleoperation_with_pid_control.launch --wait \
  drone_id_namespace:=drone$NUMID_DRONE;
exec bash\"" &
