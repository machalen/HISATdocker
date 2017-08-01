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
RUN apt-get update && apt-get -y install libtbb-dev

#Download HISAT and Bowtie2 in /bin
WORKDIR /bin
RUN wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip

#Unzip HISAT and Bowtie2
RUN unzip hisat2-2.1.0-Linux_x86_64.zip
