library(showtext);
# 导入楷体
showtext.auto(enable = TRUE)
font.add("kaishu", "simkai.ttf");


pdf('test.pdf')
# 开始使用showtext
showtext.begin();
# 一系列绘图命令
set.seed(123);
plot(1, xlim = c(-3, 3), ylim = c(-3, 3), type = "n");
text(runif(100, -3, 3), runif(100, -3, 3),
     intToUtf8(round(runif(100, 19968, 40869)), multiple = TRUE),
     col = rgb(runif(100), runif(100), runif(100), 0.5 + runif(100)/2),
     cex = 2, family = "kaishu");    # 指定kaishu字体
title("随机汉字", family = "wqy");   # 指定wqy字体
# 停止使用showtext
showtext.end();
# 关闭图形设备
dev.off();