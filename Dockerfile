FROM debian:latest
RUN apt-get update && apt-get install -y python2.7 python-pip python-dev ipython git && pip install --upgrade jupyter pandas backports.shutil_get_terminal_size
RUN cd ~/ && git clone https://github.com/PAIR-code/facets
RUN cd ~/facets/facets_dive
RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.iopub_data_rate_limit = 1000000000" >> ~/.jupyter/jupyter_notebook_config.py
RUN cd ~/facets/facets_dive
RUN jupyter nbextension install ~/facets/facets-dist/
CMD cd ~/facets/facets_dive && jupyter notebook --ip=0.0.0.0 --allow-root
