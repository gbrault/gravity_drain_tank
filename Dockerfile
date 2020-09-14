from jupyter/scipy-notebook:latest

RUN pip install -y future ipycanvas numpy matplotlib ipympl ipywidgets scipy
RUN pip install git+https://github.com/pycontribs/ruyaml.git
RUN pip install git+https://github.com/gbrault/jupytersketcher
RUN jupyter labextension update --all
RUN jupyter labextension install --nobuild @jupyter-widgets/jupyterlab-manager jupyter-matplotlib
RUN jupyter lab build
