FROM condaforge/miniforge3
ENV PATH="/opt/conda/bin:${PATH}"

# Recipe adapted from https://git.fmrib.ox.ac.uk/thanayik/fsl-docker-example-bet


# store the FSL public conda channel
ENV FSL_CONDA_CHANNEL="https://fsl.fmrib.ox.ac.uk/fsldownloads/fslconda/public"
# entrypoint activates conda environment and fsl when you `docker run <command>`
COPY /entrypoint /entrypoint
# make entrypoint executable
RUN chmod +x /entrypoint
# as a demonstration, install ONLY FSL's bet (brain extraction) tool. This is an example of a minimal, yet usable container without the rest of FSL being installed
# to see all packages available use a browser to navigate to: https://fsl.fmrib.ox.ac.uk/fsldownloads/fslconda/public/
# note the channel priority. The FSL conda channel must be first, then condaforge
RUN /opt/conda/bin/conda install -n base -c $FSL_CONDA_CHANNEL fsl-bet2 -c conda-forge
# set FSLDIR so FSL tools can use it, in this minimal case, the FSLDIR will be the root conda directory
ENV FSLDIR="/opt/conda"


#install snakemake and snakebids
RUN /opt/conda/bin/conda install -n base -c conda-forge -c bioconda snakemake
RUN pip install snakebids

#copy app to the container
COPY . /app

ENTRYPOINT [ "/entrypoint","/app/run.py"]



