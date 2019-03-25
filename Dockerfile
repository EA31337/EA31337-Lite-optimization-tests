FROM ea31337/ea31337:v1.077-dev as ea31337

# EURUSD 2017
FROM ea31337/ea-tester:EURUSD-2017-DS as eurusd-2017
# Adjust the user's UID.
ARG UID=1000
USER root
RUN usermod -u $UID ubuntu
# Copy EA files.
USER ubuntu
COPY --from=ea31337 --chown=ubuntu:root "/opt/EA" "/opt/EA"

# EURUSD 2018
FROM ea31337/ea-tester:EURUSD-2018-DS as eurusd-2018
# Adjust the user's UID.
ARG UID=1000
USER root
RUN usermod -u $UID ubuntu
# Copy EA files.
USER ubuntu
COPY --from=ea31337 --chown=ubuntu:root "/opt/EA" "/opt/EA"
