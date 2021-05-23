ROS2_DISTRO="$1"

# Source ROS 2 environment
source /opt/ros/$ROS2_DISTRO/setup.bash || exit $?

# Build workspace
colcon build --event-handlers console_cohesion+ --cmake-args || exit $?

# Source build result environment
source install/setup.bash || exit $?

# Test workspace
colcon test --event-handlers console_cohesion+ --pytest-with-coverage || exit $?
