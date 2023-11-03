# ROS 2 Workspace Action

[![latest version](https://img.shields.io/github/v/release/ichiro-its/ros2-ws-action?style=flat-square)](https://github.com/ichiro-its/ros2-ws-action/releases/)
[![license](https://img.shields.io/github/license/ichiro-its/ros2-ws-action?style=flat-square)](./LICENSE)
[![test status](https://img.shields.io/github/actions/workflow/status/ichiro-its/ros2-ws-action/test.yaml?label=test&branch=main&style=flat-square)](https://github.com/ichiro-its/ros2-ws-action/actions/workflows/test.yaml)

The ROS 2 Workspace Action is a [GitHub Action](https://github.com/features/actions) designed to setup, build and test a [ROS 2](https://www.ros.org/) workspace containing multiple packages.
This action automatically sets up ROS 2 and other dependencies used in each package, and then proceeds to build and test them all using [colcon](https://colcon.readthedocs.io/en/released/user/quick-start.html).

## Key Features

The ROS 2 Workspace Action offers the following key features:

- **Automated ROS 2 Distribution Setup:** Automatically sets up a specified ROS 2 distribution.
- **Dependency Management:** Automatically installs dependencies required for each package.
- **Efficient Building and Testing:** Utilizes colcon for streamlined building and testing of each package.

## Usage

To get started with the ROS 2 Workspace Action, you can refer to the [action.yaml](./action.yaml) file for detailed configuration options. Additionally, if you are new to GitHub Actions, you can explore the [GitHub Actions guide](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions) for a comprehensive overview.

### Inputs

Here are the available input parameters for the ROS 2 Workspace Action:

| Name | Default | Description |
| --- | --- | --- |
| `distro` | `iron` | Specify the distribution of ROS 2 to be set up using this action. You can refer to the [ROS 2 Distributions](https://docs.ros.org/en/rolling/Releases.html) for information about the available distributions to be used. |

### Examples

Here is the basic example of how to use the ROS 2 Workspace Action to build and test a ROS 2 workspace in your GitHub Actions workflow:

```yaml
name: ROS 2 CI
on:
  push:
jobs:
  build-and-test:
    name: Build and Test
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4.0.0
        with:
          path: workspace

      - name: Build and test workspace
        uses: ichiro-its/ros2-ws-action@v1.0.0
```

> It is recommended not to checkout the repository in the root directory. Otherwise, tests may fail because the package's files could be mixed with the build result.

#### Specifying ROS 2 Distribution

You can specify the ROS 2 distribution to be used by providing it as an input parameter:

```yaml
- name: Build and test workspace
  uses: ichiro-its/ros2-ws-action@v1.0.0
  with:
    distro: rolling
```

#### Running Individual Setup, Build, and Test Steps

You can use the `setup`, `build`, and `test` sub-actions to run each action individually for the setup, build, and test steps:

```yaml
- name: Setup workspace
  uses: ichiro-its/ros2-ws-action/setup@v1.0.0

- name: Build workspace
  uses: ichiro-its/ros2-ws-action/build@v1.0.0

- name: Test workspace
  uses: ichiro-its/ros2-ws-action/test@v1.0.0
```

## License

This project is licensed under the terms of the [MIT License](./LICENSE).

Copyright © 2021-2023 [ICHIRO ITS](https://github.com/ichiro-its)
