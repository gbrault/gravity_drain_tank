from jupyter/scipy-notebook:latest

USER root
RUN apt update -yq
RUN apt install -yq cm-super

RUN pip install future numpy matplotlib ipympl ipywidgets scipy
RUN pip install git+https://github.com/pycontribs/ruyaml.git
RUN pip install git+https://github.com/gbrault/jupytersketcher
RUN jupyter labextension install --no-build @jupyter-widgets/jupyterlab-manager jupyter-matplotlib
RUN jupyter lab build --dev-build=False --minimize=False

COPY ./drainingtank.yml /home/jovyan/work
COPY "./Gravity Drain Tank Modeling.ipynb" "/home/jovyan/work/Gravity Drain Tank Modeling.ipynb"
