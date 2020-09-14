from jupyter/scipy-notebook:latest

USER root
RUN apt update -yq
RUN apt install -yq cm-super
# make jovyan a sudoer
RUN usermod -aG sudo $NB_USER
RUN echo "jovyan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $NB_UID

RUN pip install future numpy matplotlib ipympl ipywidgets scipy
RUN pip install git+https://github.com/pycontribs/ruyaml.git
RUN pip install git+https://github.com/gbrault/jupytersketcher
RUN jupyter labextension install --no-build @jupyter-widgets/jupyterlab-manager jupyter-matplotlib
RUN jupyter lab build --dev-build=False --minimize=False

COPY ./drainingtank.yml /home/jovyan/work
COPY ./Gravity_Drain_Tank_Modeling.ipynb /home/jovyan/work/Gravity_Drain_Tank_Modeling.ipynb
