# ROS 2 Build and Test Workspace Action

[![latest version](https://img.shields.io/github/v/release/ichiro-its/ros2-build-and-test-action?style=flat-square)](https://github.com/ichiro-its/ros2-build-and-test-action/releases/)
[![license](https://img.shields.io/github/license/ichiro-its/ros2-build-and-test-action?style=flat-square)](./LICENSE)
[![test status](https://img.shields.io/github/actions/workflow/status/ichiro-its/ros2-build-and-test-action/test.yaml?label=test&branch=main&style=flat-square)](https://github.com/ichiro-its/ros2-build-and-test-action/actions/workflows/test.yaml)

The ROS 2 Build and Test Workspace Action is a [GitHub Action](https://github.com/features/actions) designed to build and test a [ROS 2](https://www.ros.org/) workspace containing multiple packages.
This action automatically sets up ROS 2 and other dependencies used in each package, and then proceeds to build and test them all using [colcon](https://colcon.readthedocs.io/en/released/user/quick-start.html).

## Key Features

The ROS 2 Build and Test Workspace Action offers the following key features:

- **Automated ROS 2 Distribution Setup:** Automatically sets up a specified ROS 2 distribution.
- **Dependency Management:** Automatically installs dependencies required for each package.
- **Efficient Building and Testing:** Utilizes colcon for streamlined building and testing of each package.

## Usage

To get started with the ROS 2 Build and Test Workspace Action, you can refer to the [action.yaml](./action.yaml) file for detailed configuration options. Additionally, if you are new to GitHub Actions, you can explore the [GitHub Actions guide](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions) for a comprehensive overview.

### Default Usage

```yaml
name: Build and Test Workspace
on:
  pull_request:
    branches: [ main ]
  push:
    branches: [ main ]
jobs:
  build-and-test-workspace:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout this repository
        uses: actions/checkout@v2.3.4
        with:
          path: repository
      - name: Build and test workspace
        uses: ichiro-its/ros2-build-and-test-action@main
```

> This will be defaulted to use [ROS 2 Iron Irwini](https://docs.ros.org/en/foxy/Releases/Release-Iron-Irwini.html).

> It's recommended to not checkout the repository in the root directory.
> Else, test could be failed because the package's files are mixed with the build result.

### Use Different ROS 2 Distribution

```yaml
- name: Build and test workspace
  uses: ichiro-its/ros2-build-and-test-action@main
  with:
    ros2-distro: rolling
```

## License

This project is licensed under the terms of the [MIT License](./LICENSE).

Copyright © 2021-2023 [ICHIRO ITS](https://github.com/ichiro-its)
