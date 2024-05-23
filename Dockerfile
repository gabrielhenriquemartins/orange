# FROM playright with Ubunto Jammy 22
FROM mcr.microsoft.com/playwright:jammy

# Access as root user
USER root

# Set the results folder
ENV ROBOT_REPORTS_DIR /opt/robotframework/results

# Set the tests folder
ENV ROBOT_TESTS_DIR /opt/robotframework/tests

# Setup the timezone
ENV TZ UTC

# Update and Install Python
RUN apt-get update
RUN apt-get install -y python3-pip

# Install RobotFramework and Browser Library, nodejs
RUN pip3 install robotframework
RUN pip3 install robotframework-browser
RUN pip3 install robotframework-faker
RUN rfbrowser init
RUN apt-get update
ENV NODE_PATH=/usr/lib/node_modules

# Workdir Directory
WORKDIR   /opt/robotframework/tests

# Basic command to run the image and the container
# docker image build -t robot .
# docker container run -it --rm -v "$(pwd)/tests:/opt/robotframework/tests" -v "$(pwd)/results:/opt/robotframework/results"  robot  bash -c "robot --outputdir /opt/robotframework/results  /opt/robotframework/tests"


# docker container run -it --rm -v "$(pwd)/tests:/opt/robotframework/tests" -v "$(pwd)/results:/opt/robotframework/results"  robot  bash -c "robot --outputdir /opt/robotframework/results  /opt/robotframework/tests && /opt/robotframework/tests/common/rename_video.sh"

# docker container run -it --rm -v "$(pwd)/tests:/opt/robotframework/tests" -v "$(pwd)/results:/opt/robotframework/results"  robot  bash -c "/opt/robotframework/tests/common/create_folder.sh  &&   /opt/robotframework/tests/common/execute_robot.sh   &&    /opt/robotframework/tests/common/rename_video.sh"