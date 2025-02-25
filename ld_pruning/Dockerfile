FROM rocker/tidyverse:4.4.1

# Install required packages.
RUN sudo apt-get update
RUN sudo apt-get -y install libglpk40

# Install required R packages.
RUN R -e 'install.packages("igraph")'

CMD ["/bin/bash"]
