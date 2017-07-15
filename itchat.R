library(ggplot2)
library(showtext)
showtext.auto(enable = TRUE)
font.add('simhei', 'simhei.ttf')
font.add('simkai', 'simkai.ttf')
data=read.csv('haha.txt',header=T,fileEncoding='UTF-8')
data_sort=data[order(data[,3],decreasing=T),]
data_top_10=data_sort[2:11,]
names(data_top_10)[1:3]<-c("省份","城市",'人数') 

#pdf('test.pdf')
p<-ggplot(data_top_10,aes(x=省份,y=人数,fill=城市))+geom_bar(stat='identity')+theme(text = element_text(family = 'simkai'))+labs(title = "微信号好友分布情况",x = "省份",y = "人数")+theme(plot.title = element_text(size=18,colour = "black",face = "bold"),axis.title.x = element_text(size=15,colour = "black",face = "bold"),axis.title.y = element_text(size=15,colour = "black",face = "bold"),axis.text.x = element_text(colour = "black"),axis.text.y = element_text(colour = "black"),axis.line = element_line(colour = "black",size = 0.2),panel.grid.major = element_line(colour="lightgray"),legend.key.size = unit(1,'cm'),legend.key.width=unit(1,'cm'),legend.text = element_text(colour = 'black', size = 12, face = 'bold'),legend.title = element_text(colour = 'black', size = 12, face = 'bold'))+theme(plot.title = element_text(hjust = 0.5))
#dev.off()
ggsave(p,filename='kai_test.pdf')
p<-ggplot(data_top_10,aes(x=省份,y=人数,fill=城市))+geom_bar(stat='identity')+theme(text = element_text(family = 'simhei'))+labs(title = "微信号好友分布情况",x = "省份",y = "人数")+theme(plot.title = element_text(size=18,colour = "black",face = "bold"),axis.title.x = element_text(size=15,colour = "black",face = "bold"),axis.title.y = element_text(size=15,colour = "black",face = "bold"),axis.text.x = element_text(colour = "black"),axis.text.y = element_text(colour = "black"),axis.line = element_line(colour = "black",size = 0.2),panel.grid.major = element_line(colour="lightgray"),legend.key.size = unit(1,'cm'),legend.key.width=unit(1,'cm'),legend.text = element_text(colour = 'black', size = 12, face = 'bold'),legend.title = element_text(colour = 'black', size = 12, face = 'bold'))+theme(plot.title = element_text(hjust = 0.5))
#dev.off()
ggsave(p,filename='hei_test.pdf')


