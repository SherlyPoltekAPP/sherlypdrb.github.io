setwd("D:/METOPEL UAS/SHERLY METOPEL")
library(readxl)
library(tidyverse)
library(kableExtra)
library(WDI)
read_excel("pdrb2.xlsx")
dat <- read_excel("pdrb2.xlsx")
kbl(dat) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))


# Plot 
plot(dat$ekspor,dat$impor,xlab="nilai ekspor",ylab="nilai impor")


# regresi
reg1<-lm(impor~ekspor+pdrb+kurs,data=dat)
summary(reg1) #regresi level


# plot eror

dat$m<-resid(reg1)
plot(dat$ekspor,dat$m,xlab="Nilai FOB Ekspor",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$impor,dat$m,xlab="Nilai FOB Impor",ylab="error")
abline(h=0)

dat$m<-resid(reg1)
plot(dat$pdrb,dat$m,xlab="Nilai PDRB Jawa Barat",ylab="error")
abline(h=0)

dat$m<-resid(reg1)
plot(dat$kurs,dat$m,xlab="Nilai Tukar IDR/USD",ylab="error")
abline(h=0)
