ROS2_DISTRO="$1"

# Add ROS 2 GPG key
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg || exit $?

# Add ROS 2 repository to the source list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null || exit $?

# Install required tools
sudo apt update && sudo apt install -y \
  python3-colcon-common-extensions \
  python3-rosdep || exit $?

# Initialize rosdep
sudo rosdep init || true

# Install ROS 2 workspace dependencies
rosdep update && rosdep install -y --rosdistro "$ROS2_DISTRO" --from-paths . || exit $?
