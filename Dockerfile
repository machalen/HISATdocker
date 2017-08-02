####################################################
#RNA-seq Tools
#Dockerfile to use HISAT2 2.1.0
#Ubuntu 14.04
####################################################
#Build the image based on Ubuntu
FROM ubuntu:14.04

#Maintainer and author
MAINTAINER Magdalena Arnal <marnal@imim.es>

#Install required libraries in ubuntu
RUN apt-get update && apt-get install --yes wget unzip python
#Set wokingDir in /bin
WORKDIR /bin

#Download HISAT
RUN wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip
#Unzip HISAT
RUN unzip hisat2-2.1.0-Linux_x86_64.zip
#Clean
RUN rm hisat2-2.1.0-Linux_x86_64.zip

#Install and Configure samtools
RUN wget http://github.com/samtools/samtools/releases/download/1.5/samtools-1.5.tar.bz2
RUN tar jxf samtools-1.5.tar.bz2
RUN cd samtools-1.5
RUN ./configure
RUN make
RUN rm /bin/samtools-1.5.tar.bz2

#Add Hisat and samtools to the path variable
ENV PATH $PATH:/bin/hisat2-2.1.0
ENV PATH $PATH:/bin/samtools-1.5

#Remove no installed packages wget and unzip
RUN apt-get purge --yes wget unzip

#Set the default Working Directory
WORKDIR /
