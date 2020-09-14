from jupyter/scipy-notebook:latest

RUN pip install future numpy matplotlib ipympl ipywidgets scipy
RUN pip install git+https://github.com/pycontribs/ruyaml.git
RUN pip install git+https://github.com/gbrault/jupytersketcher
RUN jupyter labextension install --no-build @jupyter-widgets/jupyterlab-manager
RUN jupyter labextension install --no-build @jupyter-widgets/jupyterlab-manager jupyter-matplotlib
RUN jupyter lab build