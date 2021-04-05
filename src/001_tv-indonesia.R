# Load Packages
library(tidyverse)
library(ggpubr)
library(haven)

# Import Data
df <- read_sav("data/tv-indonesia.sav") %>%
  dplyr::select(-FACTORS)

# Measure Distance
distance <- df  %>%
  t() %>%
  dist()

# Compute Classic Multidimensional Scaling
mds <- distance %>%
  cmdscale() %>%
  as_tibble() %>%
  rename(dim1 = V1, dim2 = V2)

# Visualize
ggscatter(mds, x = "dim1", y = "dim2", 
          label = colnames(df),
          repel = TRUE)
