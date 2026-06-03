FROM mambaorg/micromamba:latest

WORKDIR /app

# Copy environment file
COPY environment.yml .

# Create environment using mamba (fast solver)
RUN micromamba create -y -n myenv -f environment.yml \
    && micromamba clean -a -y

# Make the environment active by default
ENV PATH=/opt/conda/envs/myenv/bin:$PATH

CMD ["bash"]
