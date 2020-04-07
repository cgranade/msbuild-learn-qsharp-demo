FROM mcr.microsoft.com/quantum/iqsharp-base:0.11.2003.3107
ENV IQSHARP_HOSTING_ENV=dev-to-sckaiser-arrays

# Add RISE support.
USER root
RUN pip install rise

# Make sure the contents of our repo are in ${HOME}.
# These steps are required for use on mybinder.org.
USER root
COPY . ${HOME}
RUN chown -R ${USER} ${HOME}

# Finish by dropping back to the notebook user and installing support needed
# for C# notebooks.
USER ${USER}
