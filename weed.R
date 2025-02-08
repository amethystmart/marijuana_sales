

ggsave("marijuana_sales.pdf", width = 12, height = 8)

require(tidyverse)

ggplot(weed_df, aes(x = `Total Marijuana Sales`, 
                    y = factor(Month, levels = rev(month.name)))) +
  geom_col(aes(fill = Month == "July")) +
  scale_fill_manual(values = c("forestgreen", "#90EE90")) +  # Changed July to light green
  labs(x = "Total Sales", y = NULL,
       title = "When do Coloradans smoke the most weed?",
       subtitle = "One of the first states to legalize marijuana seem to buy the most weed in the summer months.",
       caption = "Source: Colorado Department of Revenue Marijuana Sales Jan. 2014 - Jan. 2025") +
  theme_minimal() +
  theme(
    text = element_text(size = 12),
    legend.position = "none",
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold", size = 14),
    panel.grid.major.x = element_line(color = "gray90")
  ) +
  scale_x_continuous(labels = function(x) paste0("$", x/1e9, "B")) +
  annotate("text", 
           x = max(weed_df$`Total Marijuana Sales`)/2, 
           y = "July",
           label = "$1,562,630,918",
           color = "darkgreen",  # Changed text color to darkgreen for better contrast
           fontface = "bold",
           size = 4)

ggsave("marijuana_sales_final.pdf", width = 12, height = 8)
