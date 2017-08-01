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
RUN apt-get update && apt-get install --yes wget unzip python samtools=0.1.19-1

#Download HISAT in /bin
WORKDIR /bin
RUN wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip

#Unzip HISAT
RUN unzip hisat2-2.1.0-Linux_x86_64.zip

#Remove compressed files
RUN rm hisat2-2.1.0-Linux_x86_64.zip

#Add TopHat and bowtie2 to the path variable
ENV PATH $PATH:/bin/hisat2-2.1.0

#Remove no installed packages wget and unzip
RUN apt-get purge --yes wget unzip

#Set the default Working Directory
WORKDIR /
