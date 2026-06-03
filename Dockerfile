FROM mambaorg/micromamba:latest

WORKDIR /app

# Install system fonts
RUN apt-get update && apt-get install -y --no-install-recommends \
    fontconfig \
    fonts-dejavu \
    && mkdir -p /usr/local/share/fonts \
    && fc-cache -fv \
    && rm -rf /var/lib/apt/lists/*

# Copy environment file
COPY environment.yml .

# Create environment using mamba (fast solver)
RUN micromamba create -y -n myenv -f environment.yml \
    && micromamba clean -a -y

# Make the environment active by default
ENV PATH=/opt/conda/envs/myenv/bin:$PATH

CMD ["bash"]
