library(tidyverse)
library(ggpubr)
library(MASS)

# Import Data
df <- read_csv("data/chocolate.csv")

# Measure Distance
distance <- df %>%
  t() %>%
  dist()

# Kruskal’s non-metric multidimensional scaling
mds <- distance %>%
  isoMDS() %>%
  .$points %>%
  as_tibble() %>%
  rename(dim1 = V1, dim2 = V2)

# Visualize
ggscatter(mds, x = "dim1", y = "dim2", 
          label = colnames(df),
          repel = TRUE)
