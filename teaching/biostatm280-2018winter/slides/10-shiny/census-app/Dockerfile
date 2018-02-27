# Use an official shiny runtime as a parent image
FROM rocker/shiny

# Copy the current directory contents into the container at /srv/shiny-server/
ADD . /srv/shiny-server/

# Install maps and mapproj packages
RUN R -e "install.packages(c('maps', 'mapproj'), repos='https://cran.rstudio.com/')"
