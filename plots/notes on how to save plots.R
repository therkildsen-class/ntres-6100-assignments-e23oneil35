library(tidyverse)

ggplot(data=mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point(mapping=aes (color=class, size=cyl), shape=1) +
  geom_smooth() +
  facet_wrap(~year, nrow=2) +
  theme_minimal()

ggsave(filename = "plots/hw_vs_displ.pdf", width = 8, height = 4)
### can change file type and file location by changing "plot/" or ".png"

### ?ggsave for questions/helps 

plot1 <- ggplot(data=mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point(mapping=aes (color=class, size=cyl), shape=1) +
  geom_smooth() +
  facet_wrap(~year, nrow=2) +
  theme_minimal()

###how to make it an object ^^

ggsave("plots/hw_vs_displ.pdf",plot1, width = 8, height = 4)
##how to save using only the plot1 as an object 